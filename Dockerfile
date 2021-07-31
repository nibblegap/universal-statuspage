ARG ARCH
FROM amd64/alpine:3.14.0@sha256:1775bebec23e1f3ce486989bfc9ff3c4e951690df84aa9f926497d82f2ffca9d AS base-amd64
FROM arm32v7/alpine:3.14.0@sha256:088557f18d845a348b4039a63c1266b09dfbe45619dc259f05742d902edd5f25 AS base-arm
FROM arm64v8/alpine:3.14.0@sha256:53b74ddfc6225e3c8cc84d7985d0f34666e4e8b0b6892a9b2ad1f7516bc21b54 AS base-arm64
FROM base-${ARCH}

RUN apk --no-cache add nodejs="12.22.1-r0"

COPY dist/universal-statuspage /universal-statuspage

WORKDIR /app

EXPOSE 4000

ENTRYPOINT ["node", "/universal-statuspage/server/main.js"]
