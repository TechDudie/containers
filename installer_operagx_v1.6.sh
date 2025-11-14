#!/bin/bash
set -euo pipefail

IV_HEX="5897272dfdc12e05da1a558a78feffa7"
CIPHERTEXT_B64=$(cat <<'EOF'
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
9ULju7NU4l57oyHQhe2/ow==
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
