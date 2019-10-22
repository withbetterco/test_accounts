# TestAccounts

**TestAccounts** is a Rails engine that adds a page listing available accounts for your staging site. The end goal is to facilitate sharing test accounts across your team. 

- The page listing test accounts is added by default at `/test_accounts` route
- We use Basic Authentication to restrict access to your team members.
- The page listing test accounts is not accessible in production. It returns a `404` error page.

## Requirements

- Rails 5 or newer

## Installation

- On your gemfile: `gem "test_accounts", git: "[https://github.com/withbetterco/test_accounts.git](https://github.com/withbetterco/test_accounts.git)"`
- Run `bundle install`
- Run `rails g test_accounts:install`

You can generate views to customize them:

```bash

$ rails g test_accounts:views

```

### Configuration

Override any of these defaults in `config/initializers/test_accounts.rb`:

```
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
```

#### Create an account set

`AccountSet` objects is the way you can specify the accounts you want to list in the page listing test  accounts.

    # TestAccounts Config
    admins_account_set = TestAccounts::AccountSet.new(
      "User",
      "admin",
      ["name", "email"],
      name: "Admins",
      email_login_password: "password",
      email_login_link: "https://your-staging-site/users/sign_in"
    )
    
    members_account_set = TestAccounts::AccountSet.new(
      "User",
      "member",
      ["name", "email"],
      name: "Members",
      email_login_password: "password",
      email_login_link: "https://your-staging-site.com/users/sign_in"
    )

Details for account sets creation.

`TestAccounts::AccountSet.new.(resource, scope = "all", attributes = [], options = {})`

- `resource` `string` A model class for the resource records you want to list
- `scope` `string` The scope name you want to apply on the resource you want to list. By default this engine applies `all` scope.
- `attributes` `array` A list of attributes you want to display from the account set resource
- `options` `hash` A set of options to customize details about the account set. Available options keys are:
    - `:name` Title for the account set
    - `:description` Description for the account set.
    - `:email_login_link` Link users must visit for email login
    - `:email_login_password` Password to be used to log in - email login - with any account from the account set
    - `:token_login_link` Link users must visit for token login
    - `:token_login_code` Code/Pin to be used to log in - token login - with any account from the account set

#### Add account sets to Test Account configuration

```
TestAccounts.configure do
  self.account_sets << admins_account_set
  self.account_sets << members_account_set
end
```
#### Other available configuration options

Beside adding account sets you also have the following configuration options

```
TestAccounts.configure do
  self.basic_authentication_username = "user_name"
  self.basic_authentication_password = "password"
  self.support_email = "help@support.com"
end
```

One you finish the engine configuration you can start you development server `rails s` and visit [http://localhost:3000/test_accounts](http://localhost:3000/test_accounts)


## Contributing
 We love pull requests from everyone.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
