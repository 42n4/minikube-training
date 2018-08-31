# Set up

```bash
kubectl create secret generic mysql-secrets --from-literal=mysql_root_password=ArazkkznZJzUa9gzVyCFh8Kw --from-literal=mysql_password=ntrHETrncx59q8HQ9hu2vW3q
```

````bash
kubectl create secret generic minikube-training-secrets --from-literal=app_secret=BhP6HHsvwXV5EjQVrtSX5m5a '--from-literal=database_url=mysql://minikube_training:ntrHETrncx59q8HQ9hu2vW3q@mysql:3306/minikube_training?charset=utf8'
````