#credential can be passed by env varialbes
# set GOOGLE_CREDENTIALS=gce-terraform-key.json or
# export GOOGLE_CREDENTIALS=gce-terraform-key.json

#* `GOOGLE_CREDENTIALS`
#* `GOOGLE_CLOUD_KEYFILE_JSON`
#* `GCLOUD_KEYFILE_JSON`

provider "google" {
  project     = "${var.project}"
 // region      = "${var.gce_region}"
 // credentials = "${file("../gce-terraform-key.json")}"
}

resource "google_storage_bucket" "terraform-state" {
  name     = "terraform-state-sandbox-c4coin"
 // location = "${var.gce_region}"
  storage_class = "${var.storage_class}"
  versioning = {
    enabled = "true"
  }
}


