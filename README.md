# README

Project: Private events
You want to build a site similar to a private Eventbrite which allows users to create events and then manage user signups.

A user can create events. A user can attend many events. An event can be attended by many users. Events take place at a specific date and at a location (which you can just store as a string, like “Andy’s House”).

This project will require you to model many-to-many relationships and also to be very conscious about your foreign keys and class names (hint: you won’t be able to just rely on Rails’ defaults like you have before).

## sync with git
STARTING A NEW REPO on Github
From local code:
1. navigate to the local project directory
2. initialise the directory as a repo: <git init>
3. add the files to be tracked as part of the project <git add .>
4. commit: <git commit> 
5. create a repo on Github. *Note do not initialise with README, license or .gitignore to avoid conflicts
6. copy the web or SSH address and it as a the remote origin;
   <git remote add origin <address>> >
7. <git remote -v> to check if done right
8. push the code to the main branch: <git push -u origin main> 


From Github:
1. Create new repo on Github
2. Copy the SSH address
3. git clone <ssh address> into desired directory 

README file
1. Create a README.md file if repo was created with existing local code

OOP - Planning project file structure
1. mastermind.rb as the main executable file
2. lib directory to contain sub object files
3. player.rb to manage the player-specific information and moves
4. computer.rb to manage the computer-specific information and moves
5. game_controller.rb to orchestra the flow of the game, handles turns and checks for end of game

Gemfile and Gemfile.lock
1. <bundle init> to create a default Gemfile in the current working directory
2. <bundle add <<gem name>> to add the gem
3. Gemfile has information on where to get the gems from and what gems are required
4. Gemfile.lock has information on what was the last environment that should be able to run your app. 
   Bundler will use it to install the same versions of gems even if Gemfile could potentially allow for newer versions to be installed.

Provide information on Ruby version for people using the project
1. rbenv local <version name e.g. 3.3.0>

Add rubocop to improve readability of ode
1. bundle add rubocop
2. remove requirement as it is an optional file <require: false>
3. <bundle exec rubocop <optional:filename>> to run it. Filename when provided will run rubocop only on that file
4. create a .rubocop.yml file or by using <bundle exec rubocop --init>. this is the configuration file for rubocop
5. Generally we can use the following configurations:
   require: rubocop-performance

   AllCops:
   NewCops: enable

   Style/StringLiterals:
   EnforcedStyle: double_quotes

   Style/FrozenStringLiteralComment:
   EnforcedStyle: never


## commands and steps( after syncing with github)
# rails g model Event name:string desc:string data:data
# rails g controller Events index
# rails db:migrate
# update event's index view in index.html.erb to show list of events
# bundle add devise
# bundle add responders
# rails generate devise:install
# in config/environments/development.rb, add line config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
# rails generate devise User
# rails generate migration AddNameToUsers name:string OR just modify devise's migration file
# rails db:migrate
# rails generate devise:controllers users -c registrations
# change devise_for in config/routes to
-> devise_for :users, :controllers => { registrations: 'users/registrations' }
# uncomment the following lines in devise's users' controller
-> before_action :configure_sign_up_params, only: [:create]
-> def create
  super
end
-> def configure_sign_up_params
  devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
end
# and change :attribute above to :name
# rails generate devise:views users -v registrations
# add form field to capture name
# set root path in routes to <root "events#index">
# set up routes for events <resources :events, only: [ :new, :create, :index ]>
# set up methods in events_controller, for new, create and index
# set up associations
-> for user, has_and_belongs_to_many :events
-> for event and their creatior,   has_many :created_events, class_name: 'Event', foreign_key: 'creator_id'
-> Note: the foreign key creator_id is in the events table if you check the schema. In the User model we indicate the foreign id to say that the creator id is pointing to the user
# add creator foreign key to event <rails generate migration AddCreatorToEvents creator:references>
# edit migration file so that foreign key looks like <foreign_key: { to_table: :users }>
# rails db:migrate
# create a show view for users to show all created events <rails generate controller Users show>
# update the controller




