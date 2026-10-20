#!/bin/bash
set -e

ENDPOINT="http://localhost:3900"
BUCKET="enterprise-bucket"

echo "[*] Creating a test payload..."
echo "Hello Garage S3 Storage Lab!" > test-file.txt

echo "[*] Testing upload via AWS CLI or Python..."
if command -v aws &> /dev/null; then
    AWS_ACCESS_KEY_ID="lab-key" AWS_SECRET_ACCESS_KEY="dummy-secret" \
    aws --endpoint-url="$ENDPOINT" s3 cp test-file.txt s3://"$BUCKET"/test-file.txt
    
    echo "[*] Listing bucket contents..."
    AWS_ACCESS_KEY_ID="lab-key" AWS_SECRET_ACCESS_KEY="dummy-secret" \
    aws --endpoint-url="$ENDPOINT" s3 ls s3://"$BUCKET"/
else
    echo "[-] AWS CLI not installed. You can test via S3 compatible SDKs or Python boto3."
fi

rm -f test-file.txt
echo "[*] Smoke test complete."
