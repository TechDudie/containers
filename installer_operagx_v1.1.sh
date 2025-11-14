#!/bin/bash
set -euo pipefail

IV_HEX="03d49ce45df9be93fc15fe79079b1c06"
CIPHERTEXT_B64=$(cat <<'EOF'
+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
zGQC6MzaiSPggb/TFJnY9A==
EOF
)

require_tool() {
	if ! command -v "$1" >/dev/null 2>&1; then
		echo "Missing required tool: $1" >&2
		exit 1
	fi
}

require_tool openssl
require_tool base64
require_tool xxd

read -rs -p "Enter 128-bit key: " ENCRYPTION_KEY
printf '\n'

if [[ ${#ENCRYPTION_KEY} -ne 16 ]]; then
	echo "Key must be exactly 16 characters (128 bits)." >&2
	exit 1
fi

KEY_HEX=$(printf '%s' "$ENCRYPTION_KEY" | xxd -p -c 256 | tr -d '\n')
unset ENCRYPTION_KEY

if [[ ${#KEY_HEX} -ne 32 ]]; then
	echo "Failed to derive 128-bit key." >&2
	exit 1
fi

if ! printf '%s' "$CIPHERTEXT_B64" | base64 -d | \
	openssl enc -aes-128-cbc -d -K "$KEY_HEX" -iv "$IV_HEX" | \
	bash -s -- "$@"; then
	STATUS=$?
	echo "Decryption or execution failed (exit $STATUS)." >&2
	exit $STATUS
fi
