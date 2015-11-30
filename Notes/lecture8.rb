- if current_user
  p = "I'm logged in"
  else
  p = "I'm logged out"
  li = link_to "Sign In", new_user_session_path
  li = link_to "Sign Up", new_user_registration_path

  rake routes

  validates :name, presence: true
  // make sure the user has name
