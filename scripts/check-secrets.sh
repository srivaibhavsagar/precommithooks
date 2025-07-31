#!/bin/bash
# scripts/check-secrets.sh

SECRET_REGEX='AWS_SECRET|AKIA[0-9A-Z]{16}|password|token|apikey'

echo "🔍 Scanning for potential secrets in staged files..."

files=$(git diff --cached --name-only --diff-filter=ACMR)
found_secret=0

for file in $files; do
    # Skip the secret scan script itself
    if [[ "$file" == "scripts/check-secrets.sh" ]]; then
        continue
    fi

    # Only scan text files
    if file "$file" | grep -q text; then
        if git show ":$file" | grep -nE -i "$SECRET_REGEX" > /tmp/secret_scan_result.txt; then
            echo "❌ Secret detected in: $file"
            echo "-----------------------------------"
            cat /tmp/secret_scan_result.txt
            echo "-----------------------------------"
            found_secret=1
        fi
    fi
done

rm -f /tmp/secret_scan_result.txt

if [[ $found_secret -eq 1 ]]; then
    echo "❌ Commit blocked due to potential secrets."
    exit 1
else
    echo "✅ No secrets found in staged files."
    exit 0
fi