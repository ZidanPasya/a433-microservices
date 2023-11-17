# Menggunakan base image node dari Docker Hub dengan tag 14-alpine
FROM node:14-alpine

# Membuat directory baru dengan nama app dalam container sebagai working directory
WORKDIR /app

# Menyalin semua source code ke working directory di container
COPY . .

# Menentukan agar aplikasi dapat berjalan dalam production mode
# Menggunakan container item-db sebagai database host
ENV NODE_ENV=production DB_HOST=item-db

# Menginstal dependencies untuk production dan melakukan build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# Mengekspos port yang digunakan container yaitu 8080
EXPOSE 8080

# Mengeksekusi perintah untuk menjalankan npm start
CMD ["npm", "start"]