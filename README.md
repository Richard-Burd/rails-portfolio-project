
# Rails Portfolio Project

## Overview

<p>This program is designed to tell you if your convoy has enough fuel for a long voyage or not.&nbsp  A convoy is basically a collection of vehicles traveling together, usually in a military or humanitarian capacity inside unsafe territory.&nbsp  This convoy here consists of about 8 United Nations (UN) vehicles carrying humanitarian aid into south-western Syria during the civil war in that country.</p>
<img src="https://i.imgur.com/k2SHPSe.jpg" title="source: imgur.com" />
<p>The convoy is being led by a gas-guzzling Armored Personnel Carrier (APC) proving protection against armed groups followed by 5 (somewhat) more fuel-efficient SUV's and then 2 gas-guzzling mid-sized cargo trucks in the rear.&nbsp  It can be assumed that such a convoy will not have gas stations available to stop at, and thus, will have to carry enough fuel to get in and out of the war zone safely.&nbsp  This means that certain trucks will carry gas canisters that will be used to re-fuel the other vehicles in the convoy.&nbsp  This program will tell you how much of that extra gas you will need to bring along in order to complete the trek by considering the following variables:</p>
<ul>
<li>The miles-per-gallon fuel consumption for each individual vehicle</li>
<li>The type of terrain you are traveling on (paved road, dirt road, or off road)</li>
<li>The elevation gain or loss of the terrain you are traversing</li>
<li>The total distance you will be traveling</li>
</ul>

## Cool Graphics

<p>An illustration of this work-space is available here that shows all of the major relationships between key elements of the program:<p/>
<a href="https://imgur.com/A1gh3XC"><img src="https://i.imgur.com/A1gh3XC.jpg" title="source: imgur.com" /></a>
<p>This illustration is in "map" orientation which means that the code is arranged by how it occurs within a <i>stack</i> rather than where it occurs within a particular <i>sequence</i> of code being executed.&nbsp That said, the sequencing of the 3 different different user login strategies are illustrated as shown in the bottom right-hand corner of the diagram, at the very bottom of the SYMBOL LEGEND.&nbsp  These 3 strategies are:</p>
<ul>
<li>A user can login in as a returning user.</li>
<li>A user can login as a new or returning user with their GitHub account using OmniAuth</li>
<li>A user can sign up as a new user by providing a username, email address, and password.</li>
</ul>

## About This Program

<p>This program was meant to fulfill the requirements for the Rails Portfolio Project of the Flatiron School's Online Web App Development Program.&nbsp The objective here is to demonstrate the backend development of a Ruby on Rails app that includes a basic, vanilla frontend set of views with wich to interface with the app.  The project is meant to demonstrate knowledge of these key areas:</p>
<ul>
<li>RESTful URL routes and even nested routes</li>
<li>Many-to-many object relationships</li>
<li>Secure user login and permissions</li>
<li>ActiveRecord queries</li>
</ul>
<p>A complete list of project requirements can be foind in the `spec.md` file in this repository's main directory.</p>
## Install instructions

<p>Clone this repo into your IDE and run `bundle install`.  &nbsp After that, run `rails s` to run your server...copy & paste the domain into a web browser URL and go from there.</p>

### Project File Structure
```
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
├── db
|   ├── migrate
|   │   ├── 20191103143512_create_users.rb
|   │   ├── 20191105213844_add_password_digest_to_users.rb
|   │   ├── 20191125172319_create_trips.rb
|   │   ├── 20191125172445_create_vehicles.rb
|   │   ├── 20191125172809_create_trip_legs.rb
|   │   └── 20191125172844_create_legs.rb
|   ├── schema.rb
|   └── seeds.rb
├── .gitignore
├── Gemfile
├── Gemfile.lock
├── README.md
└── spec.md
```
## License Link

<p class='util--hide'> A link to the license for this code is available <a href='https://www.gnu.org/licenses/gpl-3.0.en.html'>here</a>.
