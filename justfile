build-and-push-grid:
  docker buildx use local

  make \
    PLATFORM=linux/amd64 \
    REGISTRY=ghcr.io \
    USERNAME=djeebus/talos \
    PUSH=true \
    nonfree-kmod-nvidia-grid-pkg

build-and-push TAG='':
  docker buildx use local

  make \
    TAG={{ TAG }} \
    PLATFORM=linux/amd64 \
    REGISTRY=ghcr.io \
    USERNAME=djeebus/talos \
    PUSH=true

  make \
    TAG={{ TAG }} \
    PLATFORM=linux/amd64 \
    REGISTRY=ghcr.io \
    USERNAME=djeebus/talos \
    PUSH=true \
    nonfree

build-local TARGET:
  docker buildx use local

  rm -rf _out || true

  make \
    PLATFORM=linux/amd64 \
    REGISTRY=ghcr.io \
    USERNAME=djeebus/talos \
    DEST=_out \
    local-{{ TARGET }}
