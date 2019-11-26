# Rails Portfolio Project

## Overview

<p>Write Something</p>

## Cool Graphics

<p>Write Something</p>

## About This Program

<p>Write Something</p>

## Install instructions

Clone this repo into your IDE and run `bundle install`.  After that, run `rails s` to run your server...copy & paste the domain into a web browser URL and go from there.

### Project File Structure
```
├── .gitignore
├── Gemfile
├── Gemfile.lock
├── README.md
├── app
│   ├── assets
│   │   └── stylesheets
│   │       └── homeapp.scss
│   ├── controllers
│   │   ├── admin_controller.rb
│   │   ├── application_controller.rb
│   │   ├── sessions_controller.rb
│   │   ├── site_controller.rb
│   │   ├── static_controller.rb
│   │   ├── trips_controller.rb
│   │   ├── user_controller.rb
│   │   └── vehicles_controller.rb
│   ├── models
│   │   ├── application_record.rb
│   │   ├── leg.rb
│   │   ├── trip_leg.rb
│   │   ├── trip.rb
│   │   ├── user.rb
│   │   └── vehicle.rb
│   └── views
│       ├── layouts
│       │   ├── application.html.erb
│       │   └── convoyapp.html.erb
│       ├── sessions
│       │   └── new.html.erb
│       ├── site
│       │   ├── burdapp.html.erb
│       │   └── index.html.erb
│       ├── users
│       │   └── new.html.erb
|       └── vehicles
|           ├── edit.html.erb
|           ├── index.html.erb
|           ├── new.html.erb
|           └── show.html.erb
├── config
|   ├── initializers
|   |   └── omniauth.rb
|   └── routes.rb
└── db
    ├── migrate
    │   ├── 20191103143512_create_users.rb
    │   ├── 20191105213844_add_password_digest_to_users.rb
    │   ├── 20191125172319_create_trips.rb
    │   ├── 20191125172445_create_vehicles.rb
    │   ├── 20191125172809_create_trip_legs.rb
    │   └── 20191125172844_create_legs.rb
    ├── schema.rb
    └── seeds.rb
```
## License Link

<p class='util--hide'> A link to the license for this code is available <a href='https://www.gnu.org/licenses/gpl-3.0.en.html'>here</a> per instructions on the spec.md file located <a href='https://github.com/Richard-Burd/rails-portfolio-project/blob/master/spec.md'>here</a> in the main directory of this GitHub repository.
</p>
