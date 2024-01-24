## Run LocalStack container ##
docker run \
  --rm -it \
  -p 4566:4566 \
  -p 4510-4559:4510-4559 \
  -d \
  localstack/localstack