docker stop zhs007blog
docker run -d \
  --rm \
  --name zhs007blog \
  -p 4000:4000 \
  zhs007blog