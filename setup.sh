# start minikube 
#minikube start --extra-config=apiserver.service-node-port-range=21-30000;
minikube start
#enable metallb util
minikube addons enable metallb;

#setting env variable
eval $(minikube -p minikube docker-env);

# configure files
IP=$(minikube ip)
sed -i "" "s/IPS/$IP/g" ./srcs/metallb.yml;
sed -i "" "s/IPS/$IP/g" ./srcs/nginx/srcs/default.conf;
PW=$(openssl rand -base64 32);
sed -i "" "s|PW|$PW|g" ./srcs/phpmyadmin/srcs/config.inc.php;

# build images
docker build -t grafana-service ./srcs/grafana
docker build -t influxdb-service ./srcs/influxdb
docker build -t mysql-service ./srcs/mysql;
docker build -t phpmyadmin-service ./srcs/phpmyadmin;
docker build -t nginx-service ./srcs/nginx;
docker build -t wordpress-service ./srcs/wordpress;

# deployment of services

kubectl apply -f ./srcs/metallb.yml;
kubectl apply -f ./srcs/influxdb-service.yml;
kubectl apply -f ./srcs/grafana-service.yml;
kubectl apply -f ./srcs/nginx-service.yml;
kubectl apply -f ./srcs/mysql-service.yml ; 
kubectl apply -f ./srcs/phpmyadmin-service.yml;  
kubectl apply -f ./srcs/wordpress-service.yml;
