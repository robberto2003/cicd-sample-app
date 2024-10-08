# Node.js versie --> alpine voor kleinere imagesize
FROM node:18-alpine  

# werkdirectory
WORKDIR /webapp

# Via cashing de build in de toekomst sneller maken (indien files niet zijn aangepast)
COPY package.json yarn.lock ./

# dependencies van app installeren
RUN yarn install --frozen-lockfile

# Applicatie in webapp kopiéren
COPY . .

# Poort 3000 openzetten
EXPOSE 3000
# Applicatie starten met yarn
CMD ["yarn", "start"]
