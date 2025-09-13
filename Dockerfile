FROM node:19-alpine AS firststage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

FROM firststage AS finalstage
RUN npm install --production
COPY . .
EXPOSE 3000
CMD ["npm", "start"]
