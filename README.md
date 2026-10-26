### Building

```sh
# Build
docker build --platform linux/amd64 -t APP_NAME:latest .
# Tag
docker tag APP_NAME:latest registry-api.elmatcha.ianchao.com/APP_NAME
# Push
docker push registry-api.elmatcha.ianchao.com/APP_NAME:latest
```

One line
```sh
docker buildx build \
  --platform linux/amd64 \
  -t registry-api.elmatcha.ianchao.com/APP_NAME:VERSION_TAG \
  -t registry-api.elmatcha.ianchao.com/APP_NAME:latest \
  --push .
```
