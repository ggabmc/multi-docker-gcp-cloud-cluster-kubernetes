docker build --tag ggabmc/multi-client -f ./client/Dockerfile ./client
docker build --tag ggabmc/multi-server -f ./server/Dockerfile ./server
docker build --tag ggabmc/multi-worker -f ./worker/Dockerfile ./worker
# docker build --tag ggabmc/multi-client:latest --tag ggabmc/multi-client:$SHA -f ./client/Dockerfile ./client
# docker build --tag ggabmc/multi-server:latest --tag ggabmc/multi-server:$SHA -f ./server/Dockerfile ./server
# docker build --tag ggabmc/multi-worker:latest --tag ggabmc/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push ggabmc/multi-client
docker push ggabmc/multi-server
docker push ggabmc/multi-worker
# docker push ggabmc/multi-client:latest
# docker push ggabmc/multi-server:latest
# docker push ggabmc/multi-worker:latest
# docker push ggabmc/multi-client:$SHA
# docker push ggabmc/multi-server:$SHA
# docker push ggabmc/multi-worker:$SHA

kubectl apply -f k8s

# kubectl set image deployments/client-deployment client=ggabmc/multi-client:$SHA
# kubectl set image deployments/server-deployment server=ggabmc/multi-server:$SHA
# kubectl set image deployments/worker-deployment worker=ggabmc/multi-worker:$SHA