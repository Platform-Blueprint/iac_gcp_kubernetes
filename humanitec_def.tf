resource "humanitec_resource_definition" "gke" {
  id          = "gke-tf-3"
  name        = "gke-tf-3"
  type        = "k8s-cluster"
  driver_type = "humanitec/k8s-cluster-gke"

  driver_inputs = {
    values = {
      loadbalancer = google_container_cluster.dev.endpoint           
      name = google_container_cluster.dev.name                        
      project_id = "tom-harris-gcp"
      zone = "europe-west2-a"
    }
    secrets = {
      credentials = base64decode(google_service_account_key.key.private_key)
    }
  }
}