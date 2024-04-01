provider "aws" {
  region = var.region
}

resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd-${var.env}"
  }
}

provider "kubernetes" {
  #config_path = "~/.kube/config" # Path to kubeconfig file
  config_path = var.kubeconfigfile # Path to kubeconfig file
}

resource "helm_release" "argocd-dev" {
  name       = "argocd-dev"
  chart      = "argo-cd"
  repository = "https://argoproj.github.io/argo-helm"
  version    = "5.27.3"
  namespace  = "argocd-dev"
  timeout    = "1200"
  #values     = [templatefile("./argocd/install.yaml", {})]
  #values     = templatefile("./argocd/install.yaml", {})
  #values     = templatefile("./install.yaml", {})
  values = [yamlencode(file("./argocd/install.yaml"))]
  #values_file = "./installs.yaml"
  #values = "install.yaml"
}

resource "null_resource" "password" {
  provisioner "local-exec" {
    working_dir = "./argocd"
    command     = "kubectl -n argocd-dev get secret argocd-initial-admin-secret -o jsonpath={.data.password} | base64 -d > argocd-login.txt"
  }
}

resource "null_resource" "del-argo-pass" {
  depends_on = [null_resource.password]
  provisioner "local-exec" {
    command = "kubectl -n argocd-staging delete secret argocd-initial-admin-secret"
  }
}
