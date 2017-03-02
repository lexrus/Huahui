import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let readmeURL = URL(string: "https://raw.githubusercontent.com/shimohq/chinese-programmer-wrong-pronunciation/master/README.md")!

let task = URLSession.shared.dataTask(with: readmeURL) { (data, response, error) in
    guard error == nil else { return }
    guard let data = data else { return }
    guard let content = String(data: data, encoding: .utf8) else { return }

    let pat = "\\|\\s+([a-z ]+) +.+\\[([^\\]]+)\\] +\\| +.+\\[([^\\]]+)\\] \\|"
    let regex = try! NSRegularExpression(pattern: pat, options: [.caseInsensitive])
    let matches = regex.matches(
        in: content,
        options: [],
        range: NSRange(location: 0, length: content.characters.count)
    )

    let s = content as NSString
    matches.forEach { result in
        let word = s.substring(with: result.rangeAt(1))
        let us = s.substring(with: result.rangeAt(2))

        print("Word(\"\(word)\", US: \"\(us)\", UK: \"\"),")
    }
    PlaygroundPage.current.finishExecution()
}

task.resume()
