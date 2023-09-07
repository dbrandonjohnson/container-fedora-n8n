FROM quay.io/opentech/fedora-nodejs:nodejs18

WORKDIR /opt/node

RUN npm install n8n@1.5.1
RUN mkdir -p /opt/node/bin
RUN ln -s /opt/node/node_modules/n8n/bin/n8n /opt/node/bin/n8n 

RUN npm cache clean --force 

ENTRYPOINT ["/opt/node/bin/n8n"]

ENV N8N_USER_FOLDER=/opt/node/
ENV NODE_ENV=production

EXPOSE 5678/tcp
