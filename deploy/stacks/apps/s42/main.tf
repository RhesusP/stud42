terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.14"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.7.1"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"

  ignore_labels = [
    "security.istio.io/tlsMode",
    "service.istio.io/canonical-name",
    "service.istio.io/canonical-revision"
  ]

  ignore_annotations = [
    "sidecar.istio.io/status",
  ]
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}
