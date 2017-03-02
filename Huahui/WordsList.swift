//
//  WordsList.swift
//  Huahui
//
//  Created by Lex on 26/02/2017.
//  Copyright © 2017 lexrus.com. All rights reserved.
//

import UIKit
import AVFoundation

final class WordsList : UIViewController {

    fileprivate let tableView = UITableView()

    fileprivate let speechSynthesizer = AVSpeechSynthesizer()

    fileprivate var presentDanielJonesPhoneticSymbol = false

    private let defaults = UserDefaults(suiteName: "Huahui")!

    private let header = WordListHeader()

    fileprivate var words = Word.data

    override func viewDidLoad() {
        super.viewDidLoad()

        header.countrySegment.addTarget(
            self,
            action: #selector(didSelectPhoneticSymbol),
            for: .valueChanged
        )

        let dj = defaults.bool(forKey: "dj")
        header.countrySegment.selectedSegmentIndex = dj ? 1 : 0
        view.addSubview(header)

        view.addSubview(tableView)

        tableView.register(WordCell.self, forCellReuseIdentifier: WordCell.id)
        tableView.delegate = self
        tableView.dataSource = self
    }

    fileprivate func readCell(of indexPath: IndexPath) {
        let word = words[indexPath.row]
        if speechSynthesizer.isSpeaking {
            speechSynthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
        }

        let utterance = AVSpeechUtterance(string: word.origin)
        utterance.rate = AVSpeechUtteranceDefaultSpeechRate

        if presentDanielJonesPhoneticSymbol {
            utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        } else {
            utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        }

        speechSynthesizer.speak(utterance)
    }

    func didSelectPhoneticSymbol() {
        presentDanielJonesPhoneticSymbol = header.countrySegment.selectedSegmentIndex == 1
        defaults.set(presentDanielJonesPhoneticSymbol, forKey: "dj")
        defaults.synchronize()

        tableView.reloadData()
    }

    override func viewDidLayoutSubviews() {
        header.frame = view.bounds
        header.frame.size.height = 50
        header.frame.origin.y = 20

        tableView.frame = view.bounds
        tableView.frame.size.height = view.bounds.height - header.frame.maxY
        tableView.frame.origin.y = header.frame.maxY
    }

}

extension WordsList : UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WordCell.id) as? WordCell else {
            return UITableViewCell()
        }

        let word = words[indexPath.row]
        cell.configureWithWord(word, presentDanielJonesPhoneticSymbol: presentDanielJonesPhoneticSymbol)

        return cell
    }

    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        readCell(of: indexPath)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
