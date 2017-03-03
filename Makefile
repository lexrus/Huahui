SOURCE_URL      = "https://raw.githubusercontent.com/shimohq/chinese-programmer-wrong-pronunciation/master/README.md"
TMP_FILE        = /tmp/README.md
FIELD_SEPARATOR = "|"

define AWK_FUNCTIONS
	function trim(s) { gsub(/(^[ \t\r\n]+|[ \t\r\n]+$$)/, "", s); return s } \
	function extractWord(s) { sub(/\[.+$$/, "", s); return trim(s) } \
	function removeEmptyPhonetics(s) { sub(/\[\]/, "", s); return s } \
	function extractPhonetic(s) { \
		if ( s ~ /\[/ ) { \
			gsub(/(^.*\[|\].*$$)/, "", s) \
		} else { \
			gsub(/[^a-zA-Z ]+/, "", s) \
		}; \
		return removeEmptyPhonetics(trim(s)) \
	}
endef

define PRINT_SWIFT_ARRAY
	printf("Word(\"%s\", US=\"%s\", UK=\"\"),\n", \
		extractWord($$2), extractPhonetic($$3) \
	)
endef

define PRINT_JAVA_ARRAY
	printf("words.add(new Word(\"%s\", \"[%s]\", \"[%s]\", true));\n", \
		extractWord($$2), extractPhonetic($$3), extractPhonetic($$4) \
	)
endef

fetch:
	curl -Lo ${TMP_FILE} ${SOURCE_URL}

export_swift:
	@awk -F${FIELD_SEPARATOR} \
		'${AWK_FUNCTIONS} $$2~/[a-zA-Z]+/ { ${PRINT_SWIFT_ARRAY} }' ${TMP_FILE} | pbcopy
	@echo "Copied to your pasteboard."

export_java:
	@awk -F${FIELD_SEPARATOR} \
		'${AWK_FUNCTIONS} $$2~/[a-zA-Z]+/ { ${PRINT_JAVA_ARRAY} }' ${TMP_FILE} | pbcopy
	@echo "Copied to your pasteboard."

.PHONY: fetch export_swift
