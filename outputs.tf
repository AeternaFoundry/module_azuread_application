output "applications_id" {
  description = "Map of id values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.id if v.id != null && length(v.id) > 0 }
}
output "applications_api" {
  description = "Map of api values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => one(v.api) if v.api != null && length(v.api) > 0 }
}
output "applications_app_role" {
  description = "Map of app_role values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.app_role if v.app_role != null && length(v.app_role) > 0 }
}
output "applications_app_role_ids" {
  description = "Map of app_role_ids values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.app_role_ids if v.app_role_ids != null && length(v.app_role_ids) > 0 }
}
output "applications_client_id" {
  description = "Map of client_id values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.client_id if v.client_id != null && length(v.client_id) > 0 }
}
output "applications_description" {
  description = "Map of description values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.description if v.description != null && length(v.description) > 0 }
}
output "applications_device_only_auth_enabled" {
  description = "Map of device_only_auth_enabled values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.device_only_auth_enabled if v.device_only_auth_enabled != null }
}
output "applications_disabled_by_microsoft" {
  description = "Map of disabled_by_microsoft values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.disabled_by_microsoft if v.disabled_by_microsoft != null && length(v.disabled_by_microsoft) > 0 }
}
output "applications_display_name" {
  description = "Map of display_name values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "applications_fallback_public_client_enabled" {
  description = "Map of fallback_public_client_enabled values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.fallback_public_client_enabled if v.fallback_public_client_enabled != null }
}
output "applications_feature_tags" {
  description = "Map of feature_tags values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.feature_tags if v.feature_tags != null && length(v.feature_tags) > 0 }
}
output "applications_group_membership_claims" {
  description = "Map of group_membership_claims values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.group_membership_claims if v.group_membership_claims != null && length(v.group_membership_claims) > 0 }
}
output "applications_identifier_uris" {
  description = "Map of identifier_uris values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.identifier_uris if v.identifier_uris != null && length(v.identifier_uris) > 0 }
}
output "applications_logo_image" {
  description = "Map of logo_image values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.logo_image if v.logo_image != null && length(v.logo_image) > 0 }
}
output "applications_logo_url" {
  description = "Map of logo_url values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.logo_url if v.logo_url != null && length(v.logo_url) > 0 }
}
output "applications_marketing_url" {
  description = "Map of marketing_url values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.marketing_url if v.marketing_url != null && length(v.marketing_url) > 0 }
}
output "applications_notes" {
  description = "Map of notes values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.notes if v.notes != null && length(v.notes) > 0 }
}
output "applications_oauth2_permission_scope_ids" {
  description = "Map of oauth2_permission_scope_ids values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.oauth2_permission_scope_ids if v.oauth2_permission_scope_ids != null && length(v.oauth2_permission_scope_ids) > 0 }
}
output "applications_oauth2_post_response_required" {
  description = "Map of oauth2_post_response_required values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.oauth2_post_response_required if v.oauth2_post_response_required != null }
}
output "applications_object_id" {
  description = "Map of object_id values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.object_id if v.object_id != null && length(v.object_id) > 0 }
}
output "applications_optional_claims" {
  description = "Map of optional_claims values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => one(v.optional_claims) if v.optional_claims != null && length(v.optional_claims) > 0 }
}
output "applications_owners" {
  description = "Map of owners values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.owners if v.owners != null && length(v.owners) > 0 }
}
output "applications_password" {
  description = "Map of password values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => one(v.password) if v.password != null && length(v.password) > 0 }
  sensitive   = true
}
output "applications_prevent_duplicate_names" {
  description = "Map of prevent_duplicate_names values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.prevent_duplicate_names if v.prevent_duplicate_names != null }
}
output "applications_privacy_statement_url" {
  description = "Map of privacy_statement_url values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.privacy_statement_url if v.privacy_statement_url != null && length(v.privacy_statement_url) > 0 }
}
output "applications_public_client" {
  description = "Map of public_client values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => one(v.public_client) if v.public_client != null && length(v.public_client) > 0 }
}
output "applications_publisher_domain" {
  description = "Map of publisher_domain values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.publisher_domain if v.publisher_domain != null && length(v.publisher_domain) > 0 }
}
output "applications_required_resource_access" {
  description = "Map of required_resource_access values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.required_resource_access if v.required_resource_access != null && length(v.required_resource_access) > 0 }
}
output "applications_service_management_reference" {
  description = "Map of service_management_reference values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.service_management_reference if v.service_management_reference != null && length(v.service_management_reference) > 0 }
}
output "applications_sign_in_audience" {
  description = "Map of sign_in_audience values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.sign_in_audience if v.sign_in_audience != null && length(v.sign_in_audience) > 0 }
}
output "applications_single_page_application" {
  description = "Map of single_page_application values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => one(v.single_page_application) if v.single_page_application != null && length(v.single_page_application) > 0 }
}
output "applications_support_url" {
  description = "Map of support_url values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.support_url if v.support_url != null && length(v.support_url) > 0 }
}
output "applications_tags" {
  description = "Map of tags values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "applications_template_id" {
  description = "Map of template_id values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.template_id if v.template_id != null && length(v.template_id) > 0 }
}
output "applications_terms_of_service_url" {
  description = "Map of terms_of_service_url values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => v.terms_of_service_url if v.terms_of_service_url != null && length(v.terms_of_service_url) > 0 }
}
output "applications_web" {
  description = "Map of web values across all applications, keyed the same as var.applications"
  value       = { for k, v in azuread_application.applications : k => one(v.web) if v.web != null && length(v.web) > 0 }
}

