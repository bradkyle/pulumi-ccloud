module github.com/bradkyle/pulumi-ccloud/provider

go 1.15

replace github.com/Azure/go-autorest => github.com/Azure/go-autorest v12.4.3+incompatible

require (
	github.com/Mongey/terraform-provider-confluentcloud v0.0.7
	github.com/hashicorp/terraform-plugin-sdk v1.9.1
	github.com/hashicorp/terraform-plugin-sdk/v2 v2.0.2
	github.com/pulumi/pulumi-terraform-bridge/v2 v2.11.0
	github.com/pulumi/pulumi/sdk/v2 v2.12.0
)
