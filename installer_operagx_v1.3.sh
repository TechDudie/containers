#!/bin/bash
set -euo pipefail

IV_HEX="32434587b830b9c60134ec1d9cf05730"
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
