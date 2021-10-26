# Api for NeighbourAid App 


## Build Notes

This API is built out using a full Rails install which is converted to an API. 

It is being built to work with any Front End technology, though I have React in mind as I build. 

#### Tutorials and Resources

- https://medium.com/how-i-get-it/react-with-rails-user-authentication-8977e98762f2

## Methodology 


## Gem List

- Rack-Cors
- bcrypt 

## Steps, New Files, Major Changes 

1. Create Cors file -- **Config** > **Initializers** > **Cors.rb**
2. Setup for handling Cookies 
  - Create Session Store fille -- **Config** > **Initializers** > **session>store.rb**
3. Use a generator to create the User model -- `rails g model User username email password_digest first_name last_name street_address city state zip phone avatar deed_in_need`
  - **Note** - using `password_digest` tells bcrypt to encrypt the Users password using salts 
4. Migrate DB `rails db:create && db:migrate`
5. Configure bcrypt `has_secure_password` in **app** > **model** > **user.rb** 
  - first add the `has_secure_password` method to the top of the 
6. Add validations to **model** > **user.rb** 
7. Routes -- add corresponding routes for the user model with the correct resources. Start with the following:
  - `resources :users, only: [:create, :show, :index]`
8. Create the User controller and get it connected. **apps** > **controllers** > **users_controller.rb** 
  - add methods for index, show, and create
  - Because we aren't using the Rails views, we are rendering JSON objects that the react client can use
  - the `login!` helper method inherits from Application Controller which has additional helper methods
9. Create additional helper methods in Application Controller
  - `skip_before_action :verify_authenticity_token` -- prevents Rails from using auth token. It is not necessary to use this token whilst treating our back-end as an API.
  - `helper_method :login!, :logged_in?, :current_user, :authorized_user?, :logout!` - ensures our methods will pass to all other controllers 
  - the rest of the methods are for creating or destroying a session, or authorizing a User
10. Build out the Sessions Controller -- create the file **app** > **controllers** > **sessions_controller.rb**
11. Give the newly created controller methods their routes