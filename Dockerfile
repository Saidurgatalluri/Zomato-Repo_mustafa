FROM node:19-alpine AS FirstStage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

FROM FirstStage AS FinalStage
RUN npm install --production
COPY . .
EXPOSE 3000
CMD ["npm", "start"]
