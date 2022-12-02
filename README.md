# kube-monitoring
kube monitoring stuff

guide
https://www.civo.com/learn/kubernetes-node-monitoring-with-prometheus-and-grafana
https://myownpicloud.wordpress.com/2021/02/23/monitor-aks-infrastructure-using-prometheus-and-grafana/

Do this

helm repo add grafana https://grafana.github.io/helm-charts

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm repo update

create a namespace called 'monitoring' and change the context to that namespace




helm install prometheus prometheus-community/prometheus \
--set alertmanager.persistentVolume.storageClass="default" \
--set server.persistentVolume.storageClass="default"

helm install prometheus-node-exporter prometheus-community/prometheus-node-exporter

helm install grafana grafana/grafana \
--set persistence.storageClassName="default" \
--set persistence.enabled=true \
--set adminPassword='PASSWORD' \
--values grafana.yaml \
--set service.type=ClusterIP


edit the deployments and add the following:

tolerations:
  -key: "notallowuser"
  operator: "exists"
  effect: "NoSchedule"

      tolerations:
       - key: "userpool"
         operator: "Exists"
         effect: "NoSchedule"

check the pods are running in the system nodes.

add 1860 dashboard to grafana

remove 

helm uninstall prometheus prometheus-community/prometheus

helm uninstall grafana grafana/grafana





####testing
taint the agentpool nodes

Check the NS kube-system to make sure they are all running 

k taint no aks-agentpool-42294707-vmss000000 notallowuser=true:NoSchedule


remove taint
k taint no aks-agentpool-42294707-vmss000000 notallowuser=true:NoSchedule-


run the pwsh to deploy the app

after deployment check the pods are on the the correct nodes

k get po -l deploy=testapp -A -o wide


