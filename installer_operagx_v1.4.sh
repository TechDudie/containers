#!/bin/bash
set -euo pipefail

IV_HEX="782c3f36d9183ea76785b0164b7a576d"
CIPHERTEXT_B64=$(cat <<'EOF'
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
4+bvGwo+wEkNZyJ1j0tSLw==
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
