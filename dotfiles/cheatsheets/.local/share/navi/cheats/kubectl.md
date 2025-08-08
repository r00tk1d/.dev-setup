TODO into .cheat

List pods:
```
kubectl get pods
```

List services:
```
kubectl get svc
```

List all resources in all namespaces:
```
kubectl get all -A
```

Get pod infos:
```
kubectl get pod <pod-name> -o yaml
```

Connect to a pod:
```
kubectl exec -it <pod-name> -- bash
```

Portforward to a pod:
```
kubectl port-forward pod/<pod-name> <local-port>:<pod-port>
```

Show all active port forwards:
```
kubectl get svc -o json | jq '.items[] | {name:.metadata.name, p:.spec.ports[] } | select( .p.nodePort != null ) | "\(.name): localhost:\(.p.nodePort) -> \(.p.port) -> \(.p.targetPort)"'
```
