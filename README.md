# Accenture Devops Test

## Terraform

### Aplicar los cambios en GCP
```
terraform plan
terraform apply
```

# Luego se crea el cluster en GCP(demora unos 5 min).
## Es necesario configurar [kubectl](https://kubernetes.io/docs/tasks/tools/) en la máquina local, con la cuenta de google.
#### Es necesario tener instalado previamente el SDK de [Google Cloud](https://cloud.google.com/sdk/docs/install?hl=es-419).
```
gcloud container clusters get-credentials $(terraform output -raw kubernetes_cluster_name) --region $(terraform output -raw region)
```

# Destruír todo
```
terraform destroy
```

<p align="center">Copyright © 2022 vjdev</p>