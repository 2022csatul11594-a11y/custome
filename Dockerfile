FROM node:22-alpine
WORKDIR /app
COPY package.json server.js ./
COPY public ./public
ENV PORT=8080 APP_VERSION=1.0.0 DATA_DIR=/tmp/data
RUN mkdir -p /tmp/data && chown -R node:node /tmp/data /app
USER node
EXPOSE 8080
HEALTHCHECK --interval=30s --timeout=3s CMD wget -qO- http://localhost:8080/health || exit 1
CMD ["node", "server.js"]
