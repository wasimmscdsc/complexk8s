docker build -t wasimmscdsc/docker-react-complex-client:latest -t wasimmscdsc/docker-react-complex-client:$SHA -f ./client/Dockerfile ./client
docker build -t wasimmscdsc/docker-react-complex-server:latest -t wasimmscdsc/docker-react-complex-server:$SHA -f ./server/Dockerfile ./server
docker build -t wasimmscdsc/docker-react-complex-worker:latest -t wasimmscdsc/docker-react-complex-worker:$SHA -f ./workder/Dockerfile ./worker

docker push wasimmscdsc/docker-react-complex-client:latest
docker push wasimmscdsc/docker-react-complex-server:latest
docker push wasimmscdsc/docker-react-complex-worker:latest

docker push wasimmscdsc/docker-react-complex-client:$SHA
docker push wasimmscdsc/docker-react-complex-server:$SHA
docker push wasimmscdsc/docker-react-complex-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/client-deployment client=wasimmscdsc/docker-react-complex-client:$SHA
kubectl set image deployments/server-deployment server=wasimmscdsc/docker-react-complex-server:$SHA
kubectl set image deployments/worker-deployment worker=wasimmscdsc/docker-react-complex-worker:$SHA