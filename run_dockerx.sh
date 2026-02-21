# One-time setup: create a buildx builder
docker buildx create --name multibuilder --use
docker buildx inspect --bootstrap

# Build and push for both platforms
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  -t myominnoo/cv:dev.0.0.0.9000 \
  --push \