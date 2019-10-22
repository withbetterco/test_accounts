# Create account sets
# admins_account_set = TestAccounts::AccountSet.new(
#   "User",
#   "admin",
#   ["email"],
#   name: "Admins",
#   email_login_password: "password",
#   email_login_link: "https://your-staging-site/users/sign_in"
# )
#
# Add account sets to the page listing test accounts
# self.account_sets << admins_account_set

TestAccounts.configure do
  self.account_sets = []
  self.basic_authentication_username = "test_accounts"
  self.basic_authentication_password = "test_accounts"
  self.support_email = nil
end  