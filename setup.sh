# start minikube 
minikube start --extra-config=apiserver.service-node-port-range=22-30000

# configure files
IP=$(minikube ip)
sed -i "" "s/IPS/$IP/g" ./srcs/metallb.yml
sed -i "" "s/IPS/$IP/g" ./srcs/nginx/srcs/default.conf

# build images
docker build -t mysql-service ./srcs/mysql
docker build -t phpmyadmin-service ./srcs/phpmyadmin
docker build -t nginx-service ./srcs/nginx
docker build -t wordpress-service ./srcs/wordpress

# deployment of services

kubectl apply -f ./srcs/metallb.yml
kubectl apply -f ./srcs/nginx-service.yml
kubectl apply -f ./srcs/mysql-service.yml  
kubectl apply -f ./srcs/phpmyadmin-service.yml  
kubectl apply -f ./srcs/wordpress-service.yml
