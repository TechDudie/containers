#!/bin/bash
set -euo pipefail

IV_HEX="782c3f36d9183ea76785b0164b7a576d"
CIPHERTEXT_B64=$(cat <<'EOF'
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
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
