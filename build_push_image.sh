# Membuat docker image bernama item-app dengan tag v1
docker build -t item-app:v1 .

# Melihat daftar image yang terdapat di local
docker images

# Mengubah nama image agar sesuai dengan format Github Packages
docker tag item-app:v1 ghcr.io/zidanpasya/item-app:v1

# Membuat variabel yang menyimpan personal akses token github
export CR_PAT=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

# Melakukan login ke Github Package menggunakan env variable untuk merahasiakan pw Github
echo $CR_PAT | docker login ghcr.io -u ZidanPasya --password-stdin

# Mengunggah image ke Github Package
docker push ghcr.io/zidanpasya/item-app:v1