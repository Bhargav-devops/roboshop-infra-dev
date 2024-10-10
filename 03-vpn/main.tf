module "vpn" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  name = "${local.ec2_name}-vpn"
  ami = data.aws_ami.centos.id
  instance_type          = "t2.small"
  vpc_security_group_ids = [data.aws_ssm_parameter.vpn_sg_id.value]
  user_data = file("openvpn.sh")
  subnet_id              = data.aws_subnet.subnet_id_deafult.id
    tags =  merge(
        var.common_tags,
        {
            component = "vpn"
        },
        {
            Name = "${local.ec2_name}-vpn"
        }
    )
}