# Imagen base
FROM node:18

# Directorio de trabajo
WORKDIR /usr/src/app

# Instalar dependencias
COPY package*.json ./
RUN npm install

# Copiar los archivos del proyecto
COPY . .

# Puerto de exposición
EXPOSE 3000

# Comando para ejecutar la aplicación
CMD ["node", "server.js"]
