# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "eks-pepoc"
  type        = string
  default     = "eks-pepoc"
}

variable "cluster_endpoint" {
  type        = string
  description = "Cluster endpoint"
}

variable "cluster_ca_cert" {
  type        = string
  description = "Cluster CA certificate"
  }

variable "env" {
  description = "Environment"
  type        = string
  default     = "dev"
}

variable "kubeconfigfilepath" {
  type        = string
  description = "Path to kubeconfig file"
  default     = "/home/spacelift/.kube/config"
}

variable "release_name" {
  type        = string
  description = "Helm release name"
  default     = "argocd"
}
variable "namespace" {
  description = "Namespace to install ArgoCD chart into"
  type        = string
  default     = "argocd"
}

variable "argocd_chart_version" {
  description = "Version of ArgoCD chart to install"
  type        = string
  default     = "5.27.1" # See https://artifacthub.io/packages/helm/argo/argo-cd for latest version(s)
}

# Helm chart deployment can sometimes take longer than the default 5 minutes
variable "timeout_seconds" {
  type        = number
  description = "Helm chart deployment can sometimes take longer than the default 5 minutes. Set a custom timeout here."
  default     = 800 # 10 minutes
}

variable "admin_password" {
  description = "Default Admin Password"
  type        = string
  default     = "Welcome#77"
}

variable "values_file" {
  description = "The name of the ArgoCD helm chart values file to use"
  type        = string
  default     = "values.yaml"
}

variable "enable_dex" {
  type        = bool
  description = "Enabled the dex server?"
  default     = true
}

variable "insecure" {
  type        = bool
  description = "Disable TLS on the ArogCD API Server?"
  default     = false
}

variable "vpc_use" {
  type        = string
  description = "VPC to be used"
  default     = "vpc-b30658d4"
}


