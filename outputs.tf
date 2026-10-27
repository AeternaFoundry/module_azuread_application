output "applications_id" {
  description = "Map of id values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.id }
}
output "applications_api" {
  description = "Map of api values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => one(v.api) }
}
output "applications_app_role" {
  description = "Map of app_role values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.app_role }
}
output "applications_app_role_ids" {
  description = "Map of app_role_ids values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.app_role_ids }
}
output "applications_client_id" {
  description = "Map of client_id values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.client_id }
}
output "applications_description" {
  description = "Map of description values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.description }
}
output "applications_device_only_auth_enabled" {
  description = "Map of device_only_auth_enabled values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.device_only_auth_enabled }
}
output "applications_disabled_by_microsoft" {
  description = "Map of disabled_by_microsoft values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.disabled_by_microsoft }
}
output "applications_display_name" {
  description = "Map of display_name values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.display_name }
}
output "applications_fallback_public_client_enabled" {
  description = "Map of fallback_public_client_enabled values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.fallback_public_client_enabled }
}
output "applications_feature_tags" {
  description = "Map of feature_tags values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.feature_tags }
}
output "applications_group_membership_claims" {
  description = "Map of group_membership_claims values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.group_membership_claims }
}
output "applications_identifier_uris" {
  description = "Map of identifier_uris values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.identifier_uris }
}
output "applications_logo_image" {
  description = "Map of logo_image values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.logo_image }
}
output "applications_logo_url" {
  description = "Map of logo_url values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.logo_url }
}
output "applications_marketing_url" {
  description = "Map of marketing_url values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.marketing_url }
}
output "applications_notes" {
  description = "Map of notes values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.notes }
}
output "applications_oauth2_permission_scope_ids" {
  description = "Map of oauth2_permission_scope_ids values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.oauth2_permission_scope_ids }
}
output "applications_oauth2_post_response_required" {
  description = "Map of oauth2_post_response_required values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.oauth2_post_response_required }
}
output "applications_object_id" {
  description = "Map of object_id values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.object_id }
}
output "applications_optional_claims" {
  description = "Map of optional_claims values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => one(v.optional_claims) }
}
output "applications_owners" {
  description = "Map of owners values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.owners }
}
output "applications_password" {
  description = "Map of password values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => one(v.password) }
  sensitive   = true
}
output "applications_prevent_duplicate_names" {
  description = "Map of prevent_duplicate_names values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.prevent_duplicate_names }
}
output "applications_privacy_statement_url" {
  description = "Map of privacy_statement_url values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.privacy_statement_url }
}
output "applications_public_client" {
  description = "Map of public_client values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => one(v.public_client) }
}
output "applications_publisher_domain" {
  description = "Map of publisher_domain values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.publisher_domain }
}
output "applications_required_resource_access" {
  description = "Map of required_resource_access values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.required_resource_access }
}
output "applications_service_management_reference" {
  description = "Map of service_management_reference values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.service_management_reference }
}
output "applications_sign_in_audience" {
  description = "Map of sign_in_audience values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.sign_in_audience }
}
output "applications_single_page_application" {
  description = "Map of single_page_application values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => one(v.single_page_application) }
}
output "applications_support_url" {
  description = "Map of support_url values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.support_url }
}
output "applications_tags" {
  description = "Map of tags values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.tags }
}
output "applications_template_id" {
  description = "Map of template_id values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.template_id }
}
output "applications_terms_of_service_url" {
  description = "Map of terms_of_service_url values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.terms_of_service_url }
}
output "applications_web" {
  description = "Map of web values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => one(v.web) }
}

