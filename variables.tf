variable "agent_pool_id" {
  type        = string
  default     = null
  description = "Agent pool ID"
}

variable "auto_apply" {
  type        = bool
  default     = false
  description = "Whether to automatically apply changes when a Terraform plan is successful"
}

variable "branch" {
  type        = string
  default     = "master"
  description = "The Git branch to trigger the TFE workspace for"
}

variable "clear_text_env_variables" {
  type        = map(string)
  default     = {}
  description = "An optional map with clear text environment variables"
}

variable "clear_text_terraform_variables" {
  type        = map(string)
  default     = {}
  description = "An optional map with clear text Terraform variables"
}

variable "create_backend_file" {
  type        = bool
  default     = true
  description = "Whether to create a backend.tf containing remote backend config"
}

variable "create_repository" {
  type        = bool
  default     = false
  description = "Whether to create a new repository"
}

variable "connect_vcs_repo" {
  type        = bool
  default     = true
  description = "Whether to connect a VCS repo to the workspace"
}

variable "cosmic" {
  type = object({
    api_key    = string
    api_url    = string
    secret_key = string
    zone       = string
  })
  description = "Cosmic API client config"
}

variable "delete_branch_on_merge" {
  type        = bool
  default     = true
  description = "Whether to delete the branch after a pull request is merged"
}

variable "execution_mode" {
  type        = string
  default     = null
  description = "Which execution mode to use"
}

variable "file_triggers_enabled" {
  type        = bool
  default     = true
  description = "Whether to filter runs based on the changed files in a VCS push"
}

variable "github_admins" {
  type        = list(string)
  default     = []
  description = "A list of Github teams that should have admins access"
}

variable "github_branch_protection" {
  type = list(object({
    branches          = list(string)
    enforce_admins    = bool
    push_restrictions = list(string)

    required_reviews = object({
      dismiss_stale_reviews           = bool
      dismissal_restrictions          = list(string)
      required_approving_review_count = number
      require_code_owner_reviews      = bool
    })

    required_checks = object({
      strict   = bool
      contexts = list(string)
    })
  }))
  default     = []
  description = "The Github branches to protect from forced pushes and deletion"
}

variable "github_organization" {
  type        = string
  default     = null
  description = "The Github organization to connect the workspace to"
}

variable "github_readers" {
  type        = list(string)
  default     = []
  description = "A list of Github teams that should have read access"
}

variable "github_repository" {
  type        = string
  description = "The Github organization to connect the workspace to"
}

variable "github_writers" {
  type        = list(string)
  default     = []
  description = "A list of Github teams that should have write access"
}

variable "name" {
  type        = string
  description = "A name for the Terraform workspace"
}

variable "oauth_token_id" {
  type        = string
  description = "The OAuth token ID of the VCS provider"
}

variable "repository_description" {
  type        = string
  default     = null
  description = "A description for the Github repository"
}

variable "repository_visibility" {
  type        = string
  default     = "private"
  description = "Make the Github repository visibility"
}

variable "sensitive_env_variables" {
  type        = map(string)
  default     = {}
  description = "An optional map with sensitive environment variables"
}

variable "sensitive_terraform_variables" {
  type        = map(string)
  default     = {}
  description = "An optional map with sensitive Terraform variables"
}

variable "slack_notification_triggers" {
  type = list(string)
  default = [
    "run:created",
    "run:planning",
    "run:needs_attention",
    "run:applying",
    "run:completed",
    "run:errored"
  ]
  description = "The triggers to send to Slack"
}

variable "slack_notification_url" {
  type        = string
  default     = null
  description = "The Slack Webhook URL to send notification to"
}

variable "ssh_key_id" {
  type        = string
  default     = null
  description = "The SSH key ID to assign to the workspace"
}

variable "terraform_version" {
  type        = string
  default     = "latest"
  description = "The version of Terraform to use for this workspace"
}

variable "terraform_organization" {
  type        = string
  description = "The Terraform Enterprise organization to create the workspace in"
}

variable "trigger_prefixes" {
  type        = list(string)
  default     = ["modules"]
  description = "List of repository-root-relative paths which should be tracked for changes"
}

variable "working_directory" {
  type        = string
  default     = "terraform"
  description = "A relative path that Terraform will execute within"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to resource"
}
