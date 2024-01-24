## Install additional apt packages ##
sudo apt update -y \
    && sudo apt upgrade -y \
    && sudo apt clean -y \
    && sudo rm -rf /var/lib/apt/lists/*

## Setup AWS shared configuration and credentials files ##
# LocalStack
aws configure --profile localstack set aws_access_key_id test \
    && aws configure --profile localstack set aws_secret_access_key test \
    && aws configure --profile localstack set region us-east-1 \
    && aws configure --profile localstack set output json \
    && aws configure --profile localstack set endpoint_url http://localhost:4566 \
    && aws configure --profile localstack set skip_credentials_validation true \
    && aws configure --profile localstack set skip_metadata_api_check true \
    && aws configure --profile localstack set skip_requesting_account_id true
# AWS
aws configure --profile aws set aws_access_key_id ${AWS_ACCESS_KEY_ID} \
    && aws configure --profile aws set aws_secret_access_key ${AWS_SECRET_ACCESS_KEY} \
    && aws configure --profile aws set region ${AWS_REGION} \
    && aws configure --profile aws set output json