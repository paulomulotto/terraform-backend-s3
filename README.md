# Configurando Terraform com S3 de Backend

Este projeto foi criado com o objetivo de configurar o backend do Terraform utilizando um bucket S3 e DynamoDb. Ele irá criar estes dois recursos para salvar os arquivos de estado.

Será utilizado:

1. Conta na AWS
2. Conta no Terraform

Será criado:

1. Bucket S3 (AWS)
2. DynamoDb (AWS)
3. Workspace (Terraform)

## Como utilizar
### Parâmetros do Terraform
É necessário criar um arquivo chamado *input.tfvars*, que vai receber as informações do nome do bucket e do nome da tabela no DynamoDb.

Ex:
```
bucket_name = "pm-progseuemprego-s3-backend"
dynamodb_name = "pm-progseuemprego-dynamodb-backend"
```

Você pode consultar as variáveis utilizadas no arquivo [variables.tf](backend/s3/variables.tf). Outras variáveis já estão com valor padrão, mas você pode alterá-las.

### AWS CLI
Como o terraform irá criar os componentes do backend na AWS, é importante estar logado no seu terminal (AWS CLI) ou com as variáveis de ambiente Access key ID e Secret access key setadas corretamente.

Link de referência:

https://docs.aws.amazon.com/pt_br/cli/latest/userguide/cli-configure-files.html

### Terraform
É necessário estar logado no Terraform. 

Link de referência:

https://learn.hashicorp.com/tutorials/terraform/install-cli

Para logar, utilize o comando
```
terraform login
```

É preciso criar uma organização no Terraform Cloud.  Você deve setar essa organização no arquivo [backend.tf](backend/s3/backend.tf) no campo "organization".


## Executando
*Para executar é obrigatório as configurações acima.*

O primeiro passo é inicializar o terraform no repositório:
```
terraform init
```

Na sequência, para realizar o planejamento e coloca-lo no arquivo out.tfplan, execute:
```
terraform plan -var-file input.tfvars -out out.tfplan
```

Configura tudo que o está no planejamento e valide se está de acordo com o esperado. Se sim, siga com o comando para aplicar as alterações:
```
terraform apply out.tfplan
```

