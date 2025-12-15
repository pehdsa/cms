FROM node:20

# Instala dependências necessárias para compilar pacotes nativos (como sharp/libvips)
RUN apt-get update && apt-get install libvips-dev sqlite3 python3 -y

# Define a variável de ambiente NODE_ENV, se passada
ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}

WORKDIR /opt/app

# Copia pacotes e instala dependências
COPY ./package.json ./package-lock.json ./
RUN npm install --platform=linux --arch=x64

# Copia todo o restante do projeto
COPY . .

# Compila o projeto (ex: Strapi admin panel)
RUN npm run build

# Expõe a porta padrão do Strapi
EXPOSE 1337

# Comando padrão de inicialização
CMD ["npm", "run", "start"]
