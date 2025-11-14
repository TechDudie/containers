#!/bin/bash
set -euo pipefail

IV_HEX="4975e4c4e30d9909d0b9d68ae189148f"
CIPHERTEXT_B64=$(cat <<'EOF'
+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
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
