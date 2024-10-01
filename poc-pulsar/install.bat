helm repo add apache https://pulsar.apache.org/charts
helm repo update
helm install pulsar apache/pulsar `
    --timeout 10m `
    --set namespace=pulsar `
    --set namespaceCreate=true 