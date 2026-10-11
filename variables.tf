variable "applications" {
  description = <<EOT
Map of applications, attributes below
Required:
    - display_name
Optional:
    - description
    - device_only_auth_enabled
    - fallback_public_client_enabled
    - group_membership_claims
    - identifier_uris
    - logo_image
    - marketing_url
    - notes
    - oauth2_post_response_required
    - owners
    - prevent_duplicate_names
    - privacy_statement_url
    - service_management_reference
    - sign_in_audience
    - support_url
    - tags
    - template_id
    - terms_of_service_url
    - api (block):
        - known_client_applications (optional)
        - mapped_claims_enabled (optional)
        - oauth2_permission_scope (optional, block):
            - admin_consent_description (optional)
            - admin_consent_display_name (optional)
            - enabled (optional)
            - id (required)
            - type (optional)
            - user_consent_description (optional)
            - user_consent_display_name (optional)
            - value (optional)
        - requested_access_token_version (optional)
    - app_role (block):
        - allowed_member_types (required)
        - description (required)
        - display_name (required)
        - enabled (optional)
        - id (required)
        - value (optional)
    - feature_tags (block):
        - custom_single_sign_on (optional)
        - enterprise (optional)
        - gallery (optional)
        - hide (optional)
    - optional_claims (block):
        - access_token (optional, block):
            - additional_properties (optional)
            - essential (optional)
            - name (required)
            - source (optional)
        - id_token (optional, block):
            - additional_properties (optional)
            - essential (optional)
            - name (required)
            - source (optional)
        - saml2_token (optional, block):
            - additional_properties (optional)
            - essential (optional)
            - name (required)
            - source (optional)
    - password (block):
        - display_name (required)
        - end_date (optional)
        - start_date (optional)
    - public_client (block):
        - redirect_uris (optional)
    - required_resource_access (block):
        - resource_access (required, block):
            - id (required)
            - type (required)
        - resource_app_id (required)
    - single_page_application (block):
        - redirect_uris (optional)
    - web (block):
        - homepage_url (optional)
        - implicit_grant (optional, block):
            - access_token_issuance_enabled (optional)
            - id_token_issuance_enabled (optional)
        - logout_url (optional)
        - redirect_uris (optional)
EOT

  type = map(object({
    display_name                   = string
    tags                           = optional(set(string))
    support_url                    = optional(string)
    sign_in_audience               = optional(string)
    service_management_reference   = optional(string)
    privacy_statement_url          = optional(string)
    prevent_duplicate_names        = optional(bool)
    owners                         = optional(set(string))
    template_id                    = optional(string)
    oauth2_post_response_required  = optional(bool)
    marketing_url                  = optional(string)
    logo_image                     = optional(string)
    identifier_uris                = optional(set(string))
    group_membership_claims        = optional(set(string))
    fallback_public_client_enabled = optional(bool)
    device_only_auth_enabled       = optional(bool)
    description                    = optional(string)
    notes                          = optional(string)
    terms_of_service_url           = optional(string)
    api = optional(object({
      known_client_applications = optional(set(string))
      mapped_claims_enabled     = optional(bool)
      oauth2_permission_scope = optional(list(object({
        admin_consent_description  = optional(string)
        admin_consent_display_name = optional(string)
        enabled                    = optional(bool)
        id                         = string
        type                       = optional(string)
        user_consent_description   = optional(string)
        user_consent_display_name  = optional(string)
        value                      = optional(string)
      })))
      requested_access_token_version = optional(number)
    }))
    app_role = optional(list(object({
      allowed_member_types = set(string)
      description          = string
      display_name         = string
      enabled              = optional(bool)
      id                   = string
      value                = optional(string)
    })))
    feature_tags = optional(list(object({
      custom_single_sign_on = optional(bool)
      enterprise            = optional(bool)
      gallery               = optional(bool)
      hide                  = optional(bool)
    })))
    optional_claims = optional(object({
      access_token = optional(list(object({
        additional_properties = optional(list(string))
        essential             = optional(bool)
        name                  = string
        source                = optional(string)
      })))
      id_token = optional(list(object({
        additional_properties = optional(list(string))
        essential             = optional(bool)
        name                  = string
        source                = optional(string)
      })))
      saml2_token = optional(list(object({
        additional_properties = optional(list(string))
        essential             = optional(bool)
        name                  = string
        source                = optional(string)
      })))
    }))
    password = optional(object({
      display_name = string
      end_date     = optional(string)
      start_date   = optional(string)
    }))
    public_client = optional(object({
      redirect_uris = optional(set(string))
    }))
    required_resource_access = optional(list(object({
      resource_access = list(object({
        id   = string
        type = string
      }))
      resource_app_id = string
    })))
    single_page_application = optional(object({
      redirect_uris = optional(set(string))
    }))
    web = optional(object({
      homepage_url = optional(string)
      implicit_grant = optional(object({
        access_token_issuance_enabled = optional(bool)
        id_token_issuance_enabled     = optional(bool)
      }))
      logout_url    = optional(string)
      redirect_uris = optional(set(string))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.applications : (
        v.required_resource_access == null || alltrue([for item in v.required_resource_access : (length(item.resource_access) >= 1)])
      )
    ])
    error_message = "Each resource_access list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.applications : (
        length(v.display_name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.applications : (
        v.api == null || (v.api.known_client_applications == null || (alltrue([for x in v.api.known_client_applications : can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", x))])))
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.applications : (
        v.api == null || (v.api.oauth2_permission_scope == null || alltrue([for item in v.api.oauth2_permission_scope : (can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", item.id)))]))
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.applications : (
        v.api == null || (v.api.oauth2_permission_scope == null || alltrue([for item in v.api.oauth2_permission_scope : (item.admin_consent_description == null || (length(item.admin_consent_description) > 0))]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.applications : (
        v.api == null || (v.api.oauth2_permission_scope == null || alltrue([for item in v.api.oauth2_permission_scope : (item.admin_consent_display_name == null || (length(item.admin_consent_display_name) > 0))]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.applications : (
        v.api == null || (v.api.oauth2_permission_scope == null || alltrue([for item in v.api.oauth2_permission_scope : (item.user_consent_description == null || (length(item.user_consent_description) > 0))]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.applications : (
        v.api == null || (v.api.oauth2_permission_scope == null || alltrue([for item in v.api.oauth2_permission_scope : (item.user_consent_display_name == null || (length(item.user_consent_display_name) > 0))]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.applications : (
        v.app_role == null || alltrue([for item in v.app_role : (can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", item.id)))])
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.applications : (
        v.app_role == null || alltrue([for item in v.app_role : (length(item.description) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.applications : (
        v.app_role == null || alltrue([for item in v.app_role : (length(item.display_name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.applications : (
        v.description == null || (length(v.description) >= 0 && length(v.description) <= 1024)
      )
    ])
    error_message = "must be between 0 and 1024 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.applications : (
        v.identifier_uris == null || (alltrue([for x in v.identifier_uris : length(x) > 0]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.applications : (
        v.logo_image == null || (can(base64decode(v.logo_image)))
      )
    ])
    error_message = "must be valid base64"
  }
  validation {
    condition = alltrue([
      for k, v in var.applications : (
        v.notes == null || (length(v.notes) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.applications : (
        v.optional_claims == null || (v.optional_claims.access_token == null || alltrue([for item in v.optional_claims.access_token : (item.source == null || (contains(["user"], item.source)))]))
      )
    ])
    error_message = "must be one of: user"
  }
  validation {
    condition = alltrue([
      for k, v in var.applications : (
        v.optional_claims == null || (v.optional_claims.access_token == null || alltrue([for item in v.optional_claims.access_token : (item.additional_properties == null || (alltrue([for x in item.additional_properties : contains(["cloud_displayname", "dns_domain_and_sam_account_name", "emit_as_roles", "include_externally_authenticated_upn_without_hash", "include_externally_authenticated_upn", "max_size_limit", "netbios_domain_and_sam_account_name", "on_premise_security_identifier", "sam_account_name", "use_guid"], x)])))]))
      )
    ])
    error_message = "must be one of: cloud_displayname, dns_domain_and_sam_account_name, emit_as_roles, include_externally_authenticated_upn_without_hash, include_externally_authenticated_upn, max_size_limit, netbios_domain_and_sam_account_name, on_premise_security_identifier, sam_account_name, use_guid"
  }
  validation {
    condition = alltrue([
      for k, v in var.applications : (
        v.optional_claims == null || (v.optional_claims.id_token == null || alltrue([for item in v.optional_claims.id_token : (item.source == null || (contains(["user"], item.source)))]))
      )
    ])
    error_message = "must be one of: user"
  }
  validation {
    condition = alltrue([
      for k, v in var.applications : (
        v.optional_claims == null || (v.optional_claims.id_token == null || alltrue([for item in v.optional_claims.id_token : (item.additional_properties == null || (alltrue([for x in item.additional_properties : contains(["cloud_displayname", "dns_domain_and_sam_account_name", "emit_as_roles", "include_externally_authenticated_upn_without_hash", "include_externally_authenticated_upn", "max_size_limit", "netbios_domain_and_sam_account_name", "on_premise_security_identifier", "sam_account_name", "use_guid"], x)])))]))
      )
    ])
    error_message = "must be one of: cloud_displayname, dns_domain_and_sam_account_name, emit_as_roles, include_externally_authenticated_upn_without_hash, include_externally_authenticated_upn, max_size_limit, netbios_domain_and_sam_account_name, on_premise_security_identifier, sam_account_name, use_guid"
  }
  validation {
    condition = alltrue([
      for k, v in var.applications : (
        v.optional_claims == null || (v.optional_claims.saml2_token == null || alltrue([for item in v.optional_claims.saml2_token : (item.source == null || (contains(["user"], item.source)))]))
      )
    ])
    error_message = "must be one of: user"
  }
  validation {
    condition = alltrue([
      for k, v in var.applications : (
        v.optional_claims == null || (v.optional_claims.saml2_token == null || alltrue([for item in v.optional_claims.saml2_token : (item.additional_properties == null || (alltrue([for x in item.additional_properties : contains(["cloud_displayname", "dns_domain_and_sam_account_name", "emit_as_roles", "include_externally_authenticated_upn_without_hash", "include_externally_authenticated_upn", "max_size_limit", "netbios_domain_and_sam_account_name", "on_premise_security_identifier", "sam_account_name", "use_guid"], x)])))]))
      )
    ])
    error_message = "must be one of: cloud_displayname, dns_domain_and_sam_account_name, emit_as_roles, include_externally_authenticated_upn_without_hash, include_externally_authenticated_upn, max_size_limit, netbios_domain_and_sam_account_name, on_premise_security_identifier, sam_account_name, use_guid"
  }
  validation {
    condition = alltrue([
      for k, v in var.applications : (
        v.owners == null || (alltrue([for x in v.owners : can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", x))]))
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.applications : (
        v.required_resource_access == null || alltrue([for item in v.required_resource_access : (alltrue([for item in item.resource_access : (can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", item.id)))]))])
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.applications : (
        v.template_id == null || (can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.template_id)))
      )
    ])
    error_message = "must be a valid UUID"
  }
  # Note: 14 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

