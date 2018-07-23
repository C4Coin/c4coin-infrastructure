#vpc
project = "pei-sandbox"
vpc_name = "pei-sandbox"

#firewall
protocol ="tcp"
firewall_name = "allow-internal"
ports = ["22"]
source_ranges = ["0.0.0.0/0"]
