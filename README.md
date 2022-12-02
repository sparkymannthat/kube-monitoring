# kube-monitoring
kube monitoring stuff

Rough guide.
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

add 1860 dashboard to grafana

remove 

helm uninstall prometheus prometheus-community/prometheus

helm uninstall grafana grafana/grafana

