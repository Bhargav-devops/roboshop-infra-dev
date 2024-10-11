module "mongodb" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  name = "${local.ec2_name}-mongodb"
  ami = data.aws_ami.centos8.id
  instance_type          = "t3.small"
  vpc_security_group_ids = [data.aws_ssm_parameter.mongodb_sg_id.value]
  subnet_id              = local.database_subnet_id
    tags =  merge(
        var.common_tags,
        {
            component = "mongodb"
        },
        {
            Name = "${local.ec2_name}-mongodb"
        }
    )
}

resource "null_resource" "mongodb" {
  # Changes to any instance of the cluster requires re-provisioning
  triggers = {
    instance_id = module.mongodb.id
  }

  # Bootstrap script can run on any instance of the cluster
  # So we just choose the first in this case
  connection {
    host = module.mongodb.private_ip
    type = "ssh"
    user = "centos"
    password = "DevOps321"
  }

    provisioner "file" {
    source      = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
    }

  provisioner "remote-exec" {
    # Bootstrap script called with private_ip of each node in the cluster
    inline = [
        "chmod +x /tmp/bootstrap.sh",
        "sudo sh /tmp/bootstrap.sh mongodb dev"
    ]
  }
}

module "redis" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  name = "${local.ec2_name}-redis"
  ami = data.aws_ami.centos8.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.redis_sg_id.value]
  subnet_id              = local.database_subnet_id
    tags =  merge(
        var.common_tags,
        {
            component = "redis"
        },
        {
            Name = "${local.ec2_name}-redis"
        }
    )
}

resource "null_resource" "redis" {
  # Changes to any instance of the cluster requires re-provisioning
  triggers = {
    instance_id = module.redis.id
  }

  # Bootstrap script can run on any instance of the cluster
  # So we just choose the first in this case
  connection {
    host = module.redis.private_ip
    type = "ssh"
    user = "centos"
    password = "DevOps321"
  }

    provisioner "file" {
    source      = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
    }

  provisioner "remote-exec" {
    # Bootstrap script called with private_ip of each node in the cluster
    inline = [
        "chmod +x /tmp/bootstrap.sh",
        "sudo sh /tmp/bootstrap.sh redis dev"
    ]
  }
}