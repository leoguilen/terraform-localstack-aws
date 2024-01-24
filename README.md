# Terraform + LocalStack + AWS

This is a simple example of how to use Terraform with LocalStack to create AWS resources locally.

## Requirements

- [Docker](https://www.docker.com/)
- [VSCode](https://code.visualstudio.com/)
- [DevContainers](https://code.visualstudio.com/docs/remote/containers)

## How to test

1. Clone this repository
```bash
git clone https://github.com/leoguilen/terraform-localstack-aws.git terraform-localstack-aws
```

2. Open the project in VSCode
```bash
cd terraform-localstack-aws
code .
```

3. Set the `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY` and `AWS_REGION` environment variables in the `.devcontainer/devcontainer.json` file
```bash
"remoteEnv": {
	"AWS_ACCESS_KEY_ID": "<aws-access-key-id>",
	"AWS_SECRET_ACCESS_KEY": "<aws-secret-access-key>",
	"AWS_REGION": "<aws-region>"
}
```

4. Reopen the project in the DevContainer

5. Run the `make` command to view the available commands
```bash
make
```

6. Run the `make localstack-infra-up` command to initialize the Terraform project and create the infrastructure in LocalStack.
Running this command will can see the SQS resources created in LocalStack:
```bash
AWS_PROFILE=localstack aws sqs list-queues
```

7. Run the `make localstack-infra-down` command to destroy the infrastructure in LocalStack