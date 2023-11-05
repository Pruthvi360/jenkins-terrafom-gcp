export JENKINS_PROJECT_ID=$(cd ../jenkins-gke/tf-gke && terraform output jenkins_project_id)
export ZONE=$(cd ../jenkins-gke/tf-gke && terraform output zone)
export CLUSTER_NAME=$(cd ../jenkins-gke/tf-gke && terraform output cluster_name)
gcloud container clusters get-credentials ${CLUSTER_NAME} --zone=${ZONE} --project=${JENKINS_PROJECT_ID}
printf jenkins-username:admin;echo
printf jenkins-password: ; printf $(kubectl get secret --namespace default jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode);echo
