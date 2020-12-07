# start minikube
    minikube start --extra-config=apiserver.service-node-port-range=21-30000;
    #enable metallb util
    minikube addons enable metallb;

    #setting env variable
    eval $(minikube -p minikube docker-env);

    # configure files
    IP=$(minikube ip)
    sed -i "" "s/IPS/$IP/g" ./srcs/metallb.yml;
    sed -i "" "s/IPS/$IP/g" ./srcs/nginx/srcs/default.conf;
    sed -i "" "s/IPS/$IP/g" ./srcs/ftps/srcs/entry_point.sh;
    sed -i "" "s/MIN_IP/$IP/g" ./srcs/mysql/srcs/wordpress_db.sql;


    PW=$(openssl rand -base64 32);
    sed -i "" "s|PW|$PW|g" ./srcs/phpmyadmin/srcs/config.inc.php;

    # build images
    docker build -t grafana-service ./srcs/grafana;
    docker build -t influxdb-service ./srcs/influxdb;
    docker build -t mysql-service ./srcs/mysql;
    docker build -t phpmyadmin-service ./srcs/phpmyadmin;
    docker build -t nginx-service ./srcs/nginx;
    docker build -t wordpress-service ./srcs/wordpress;
    docker build -t ftps-service ./srcs/ftps;



    kubectl apply -f ./srcs/metallb.yml;
    kubectl apply -f ./srcs/influxdb-service.yml;
    kubectl apply -f ./srcs/ftps-service.yml;
    kubectl apply -f ./srcs/grafana-service.yml;
    kubectl apply -f ./srcs/nginx-service.yml;
    kubectl apply -f ./srcs/phpmyadmin-service.yml;  
    kubectl apply -f ./srcs/wordpress-service.yml;
    kubectl apply -f ./srcs/mysql-service.yml;
	status="not working"
    until [ $status=="Running" ];
	do
		status=$(kubectl get pod | grep mysql | awk '{print $3}')
		sleep 5
	done	
    kubectl exec -i $(kubectl get pod | grep mysql| cut -d " " -f1) -- mysql -u root -p1234 wordpress_db < srcs/mysql/srcs/wordpress_db.sql


	# docker rmi -f grafana-service ;
    # docker rmi -f influxdb-service ;
    # docker rmi -f mysql-service   ;  
	# docker rmi -f phpmyadmin-service ;
    # docker rmi -f nginx-service ;
    # docker rmi -f wordpress-service ;
    # docker rmi -f ftps-service ;



