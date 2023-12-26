FROM node:14
RUN git clone https://github.com/missnora07/Gemini-API /api/Nora07
WORKDIR /api/Nora07
COPY package*.json ./
COPY . .
RUN npm install express @google/generative-ai body-parser cors
EXPOSE 3000
CMD ["node", "index.js"]
