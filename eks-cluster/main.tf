resource "aws_eks_cluster" "eks" {
  name     = "eks-cluster"
  role_arn = var.eks_cluster_role_arn_in
  version  = "1.30"


  vpc_config {
    subnet_ids              = [var.eks_private_1_in, var.eks_private_2_in]
    endpoint_private_access = true
    endpoint_public_access  = true
  }

}

data "tls_certificate" "eks_tls_certificate" {
  url = aws_eks_cluster.eks.identity.0.oidc.0.issuer
}
