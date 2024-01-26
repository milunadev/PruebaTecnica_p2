resource "aws_instance" "Mongo_EC2" {
  # Regla de seguridad para permitir todo el tráfico interno desde la red por defecto
  ami = "ami-09694bfab577e90b0"
  instance_type = "t2.small"
  key_name = "PC_KeyPair"
  tags = {
    Name = "EC2_MongoDB"
  }
  security_groups = [ aws_security_group.Mongo_SecurityGroup.name]
  user_data = <<-EOF
            #!/bin/bash

            # Crear el archivo de repositorio de MongoDB 7.0
            cat <<EOT > /etc/yum.repos.d/mongodb-org-7.0.repo
            [mongodb-org-7.0]
            name=MongoDB Repository
            baseurl=https://repo.mongodb.org/yum/amazon/2023/mongodb-org/7.0/x86_64/
            gpgcheck=1
            enabled=1
            gpgkey=https://pgp.mongodb.com/server-7.0.asc
            EOT

            # Instalar MongoDB
            sudo yum install -y mongodb-org

            # Iniciar MongoDB y habilitarlo para que se inicie en el arranque
            sudo systemctl start mongod
            sudo systemctl enable mongod
            EOF
}


