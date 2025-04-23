#!/bin/bash

#Definir a variavel de ambiente SSH_KEY_PATH, alterar o caminho para o seu arquivo de chave SSH
export SSH_KEY_PATH=/home/pc-gabriel/projeto_financas_devops/terraform-project/ambientes/dev/main-key.pem

# Caminho para o diretório onde o Terraform está localizado
TERRAFORM_DIR="../terraform-project/ambientes/dev"

# Caminho para o arquivo JSON com os outputs do Terraform
terraform_output_file="../ansible/terraform_output.json"

# Gera o JSON com os outputs do Terraform
terraform -chdir=$TERRAFORM_DIR output -json > $terraform_output_file

# Lê os IPs do backend, frontend e nginx
BACKEND_IPS=$(jq -r '.instance_ip_back_end.value[]' $terraform_output_file)
FRONTEND_IPS=$(jq -r '.instance_ip_front_end.value[]' $terraform_output_file)
NGINX_IPS=$(jq -r '.instance_ip_nginx.value[]' $terraform_output_file)

# Cria o arquivo de inventário do Ansible em YAML
cat <<EOF > ../ansible/inventory.yml
all:
  vars:
    ansible_ssh_common_args: '-o StrictHostKeyChecking=no'
    ansible_ssh_private_key_file: "{{ lookup('env', 'SSH_KEY_PATH') }}"
  children:
    nginx:
      hosts:
EOF

# Adiciona os IPs do nginx no arquivo de inventário
for ip in $NGINX_IPS; do
  echo "        $ip:" >> ../ansible/inventory.yml
  echo "          ansible_user: ec2-user" >> ../ansible/inventory.yml
done

# Adiciona os IPs do backend no arquivo de inventário
cat <<EOF >> ../ansible/inventory.yml
    backend:
      hosts:
EOF
for ip in $BACKEND_IPS; do
  echo "        $ip:" >> ../ansible/inventory.yml
  echo "          ansible_user: ec2-user" >> ../ansible/inventory.yml
done

# Adiciona os IPs do frontend no arquivo de inventário
cat <<EOF >> ../ansible/inventory.yml
    frontend:
      hosts:
EOF
for ip in $FRONTEND_IPS; do
  echo "        $ip:" >> ../ansible/inventory.yml
  echo "          ansible_user: ec2-user" >> ../ansible/inventory.yml
done

echo "Arquivo de inventário gerado com sucesso em ../ansible/inventory.yml"
