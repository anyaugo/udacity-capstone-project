# Authenticate ECS Repo
aws ecr-public get-login-password --region us-west-2 | docker login --username AWS --password-stdin public.ecr.aws/v4n3e9u9

# Build image
docker build -t chibsapp .

# Tag image
docker tag chibsapp:latest public.ecr.aws/v4n3e9u9/chibsapp:${CIRCLE_WORKFLOW_ID:0:7}

# List images
docker image ls

# Push image to ECS docker Repo
docker push public.ecr.aws/v4n3e9u9/chibsapp:${CIRCLE_WORKFLOW_ID:0:7}