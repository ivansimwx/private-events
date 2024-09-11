# README

Project: Private events
You want to build a site similar to a private Eventbrite which allows users to create events and then manage user signups.

A user can create events. A user can attend many events. An event can be attended by many users. Events take place at a specific date and at a location (which you can just store as a string, like “Andy’s House”).

This project will require you to model many-to-many relationships and also to be very conscious about your foreign keys and class names (hint: you won’t be able to just rely on Rails’ defaults like you have before).

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
# rails db:migrate
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



