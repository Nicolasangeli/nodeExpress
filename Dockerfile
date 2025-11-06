FROM node:18

WORKDIR /main

# Copiar package.json e package-lock.json primeiro (melhor cache)
COPY package*.json ./

# Instalar dependências
RUN npm install

# Depois copiar o resto dos arquivos
COPY . .

# Garantir que a pasta public e db.json existam e tenham permissões corretas
RUN mkdir -p public && \
    touch db.json && \
    chown -R node:node /main

# Porta que o json-server vai usar
EXPOSE 3000

# Mudar para usuário node (segurança)
USER node

# Comando para iniciar o servidor
CMD ["npm", "start"]
