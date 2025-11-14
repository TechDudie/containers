#!/bin/bash
set -euo pipefail

IV_HEX="d51b8160847fb6d1dbad0cb3dfdffd28"
CIPHERTEXT_B64=$(cat <<'EOF'
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
n2US4pCwCoTAmwXNVQdpPQ==
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
