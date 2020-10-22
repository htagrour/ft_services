docker-machine start afra
eval $(docker-machine env afra)
export AUTHORIZED_KEYS=$(cat ~/.ssh/id_rsa.pub)
docker-compose up