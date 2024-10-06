FROM ghcr.io/loft-sh/devspace-containers/javascript:18-alpine

COPY javascript /home/app/.

WORKDIR /home/app/javascript
RUN npm install

ENTRYPOINT [ "node", "src/app.js" ]