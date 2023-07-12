#################################
# GITHUB                        #
#################################

# Creating a GitHub repository.
resource "github_repository" "github-repo-one" {
  name        = "${var.author}-for-the-${var.iteration[1]}-time"                      # Repo name.
  description = "Sweet junk made by ${var.author} for the ${var.iteration[1]} time."  # Repo description.
  visibility  = "public"                                                               # Repo visibility.
}

# Creating a GitHub repository.
resource "github_repository" "github-repo-two" {
  name        = "${var.author}-for-the-${var.iteration[2]}-time"                      # Repo name.
  description = "Sweet junk made by ${var.author} for the ${var.iteration[2]} time."  # Repo description.
  visibility  = "public"                                                               # Repo visibility.
}

# Creating a GitHub repository.
resource "github_repository" "github-repo-three" {
  name        = "${var.author}-for-the-${var.iteration[3]}-time"                      # Repo name.
  description = "Sweet junk made by ${var.author} for the ${var.iteration[3]} time."  # Repo description.
  visibility  = "public"                                                               # Repo visibility.
}
