kubectl create ns redis

# Deploy Redis.
kubectl create -f redis.yaml
kubectl create -f redis-slave.yaml

# create loadbalancer
kubectl create -f redis-loadbalancer.yaml

# test
kubectl run -it redis-cli --image=redis --restart=Never /bin/bash
redis-benchmark -q -h redis.slateci.net -p 6379 -c 100 -n 1000000