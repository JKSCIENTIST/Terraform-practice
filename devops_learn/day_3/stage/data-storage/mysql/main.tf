resource "aws_db_instance" "niggapromaxultraversion" {
  identifier_prefix = "terraform-upand-running"
  engine = "mysql"
  allocated_storage = 10
  instance_class = "db.t2.micro"
  skip_final_snapshot = true
  db_name = "mininigga"

  username = var.db_username
  password = var.db_password
}