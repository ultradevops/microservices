clear
kubectl create namespace microservices
#kubectl create -f archive/msckt.v1.0.yaml

kubectl create -f "https://raw.githubusercontent.com/ultradevops/microservices/ultradevops-patch-1/cktmicroservice.yaml"
#### getting the load balancer port


#nodeport=`kubectl describe svc -n microservices | grep 'NodePort' | cut -d'>' -f2 |cut -d'/' -f1|rd ''`

nodeport=`kubectl describe svc -n microservices | grep 'NodePort:' | cut -d'>' -f2 |cut -d'/' -f1| tr -d ' '|tr -d ' '`

#lbport=bin/getserport.sh

sleep 2

echo 'service port exposed is ::'$nodeport
np=`echo $nodeport|cut -d' ' -f2`

export set default_namspace=microservices
export set default_image=ultradev/dockerwebv1.0
export set default_lbserviceurl=http://localhost:$np/DockerWeb/PingDocker
export set default_dashboard=http://localhost:8001/api/v1/proxy/namespaces/kube-system/services/kubernetes-dashboard/#/admin?namespace=_all


lb='http://localhost:'$np
#export set default_cktservice=http://localhost:$np/DockerWeb/CircuitFormatService?cktvalue=XCH..123.123&ckttype=simple&dolog=N


echo ''
echo ''

echo ' I N S T A L L  D E T A I L S'
echo ''

echo ''
echo 'N O D E P O R T '$np
echo ''
echo 'D A S H B O A R D '$default_dashboard
echo ''
echo 'P I N G  U R L '$default_lbserviceurl
echo ''
