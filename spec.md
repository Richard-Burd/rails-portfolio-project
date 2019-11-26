
# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
      <li class='util--hide'>Yup.</li><br>

- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
      <li class='util--hide'>A user has many vehicles.</li><br>
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
      <li class='util--hide'>A vehicle belongs to a user.</li><br>
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
     <li class='util--hide'>A user has many trips through vehicles, a trip has many legs through trip_legs.</li><br>
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
     <li class='util--hide'>The `trip_leg.rb` join table in the app/models directory fulfills the requirements of this 'z' variable.</li><br>
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
     <li class='util--hide'>A user has many vehicles through trips; and a user can modify attributes of both trips (such as start & end locations) as well as vehicles, e.g. miles per gallon & name.</li><br>
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
     <li class='util--hide'>A user must have a unique username & email address...vehicles must hav miles per gallon expressed as integers.</li><br>
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
     <li class='util--hide'>This requirement can be found in app/controllers/trips_controller.rb in the edit action in the follwing code: <p> `if Trip.find(params[:id]).vehicles.where(user_id: current_user.id).exists? == true`</p></li><br>
- [x] Include signup (how e.g. Devise)
     <li class='util--hide'>app/views/users/new.html.erb.</li><br>
- [x] Include login (how e.g. Devise)
     <li class='util--hide'>app/views/sessions/new.html.erb</li><br>
- [x] Include logout (how e.g. Devise)
     <li class='util--hide'>app/views/layouts/convoyapp.html.erb</li><br>
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
     <li class='util--hide'>app/views/sessions/new.html.erb</li><br>
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
     <li class='util--hide'>A user can navigate in the browser to "/users/1/vehicles/1" because vehicles are nested under users in ./config/routes: </li><br>
     <p>`resources :users do`</p>
    <p>&nbsp&nbsp`resources :vehicles`</p>
    <p> `end`</p>
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
     <li class='util--hide'>A new vehicle can be created, and vehicles are nested within users as described above.</li><br>
- [x] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
