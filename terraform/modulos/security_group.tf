resource "aws_security_group" "Mongo_SecurityGroup" {
  name = "Mongo_SecurityGroup"
}
resource "aws_security_group_rule" "allow_mongo_connection"{
  type = "ingress"
  security_group_id = aws_security_group.Mongo_SecurityGroup.id
  from_port = 27017
  to_port = 27017
  protocol = "tcp"
  cidr_blocks = [ "0.0.0.0/0" ]
}
resource "aws_security_group_rule" "allow_ssh_connection"{
  type = "ingress"
  security_group_id = aws_security_group.Mongo_SecurityGroup.id
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = [ "0.0.0.0/0" ]
}
resource "aws_security_group_rule" "allow_db_all_outbound" {
  type              = "egress"
  security_group_id = aws_security_group.Mongo_SecurityGroup.id
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}