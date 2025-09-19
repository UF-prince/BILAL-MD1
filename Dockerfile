FROM node:18
WORKDIR /app
RUN mkdir -p /root/.ssh
COPY id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts
RUN git clone git@github.com:BilalTech05/BILAL-MD.git .
RUN npm install
EXPOSE $PORT
CMD ["node", "index.js"]
