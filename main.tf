resource "aws_eks_cluster" "eks_cluster" {
    name = "eks_task"
    role_arn = "arn:aws:iam::779527285137:role/AWSdevopscerttaskrole"
    vpc_config{
        subnet_ids = var.subnet_ids
    }


}


resource "aws_eks_node_group" "example" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "example"
  node_role_arn   = "arn:aws:iam::779527285137:role/AWSdevopscerttaskrole"
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }
}
