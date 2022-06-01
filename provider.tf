# Configure the GCP provider

provider "google" {
    credentials = file("./plenary-magpie-351418-af4d67287d66.json")
}