resource "aws_eks_cluster" "eks_cluster" {
    name = "eks_task"
    role_arn = "arn:aws:iam::779527285137:role/AWSdevopscerttaskrole"
    vpc_config{
        subnet_ids = aws_subnet.subnet[*].id
    }


}

resource "aws_vpc" "vpc"{
    cidr_block = "10.0.0.0/16"
}
resource "aws_subnet" "subnet"{
    vpc_id=aws_vpc.vpc.id
    cidr_block ="10.0.1.0/24"

}

resource "aws_eks_node_group" "example" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "example"
  node_role_arn   = "arn:aws:iam::779527285137:role/AWSdevopscerttaskrole"
  subnet_ids      = aws_subnet.subnet[*].id

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  update_config {
    max_unavailable = 2
  }
}