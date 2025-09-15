FROM node:18

WORKDIR /app

# SSH Key Setup
RUN mkdir -p /root/.ssh
COPY id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

# Clone Private Repo
RUN git clone git@github.com:BilalTech05/BILAL-MD.git .

# Install Dependencies
RUN npm install

# Expose Port (Heroku dynamic port)
EXPOSE $PORT

# Start Command
CMD ["node", "index.js"]
