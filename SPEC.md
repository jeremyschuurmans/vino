# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project.
      #This project was built with love and Rails.
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
      #User has_many Comments
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
      #Comment belongs_to User
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
      #User has_many Wines through Comments
      #Wine has_many Users through Comments
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
      #User has_many Comments
      #Wine has_many Comments
      #User has_many Wines through Comments
      #Wine has_many Users through Comments

- [x] The "through" part of the has_many through includes at least one user submit-able attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
      #User is able to submit content in comments (comments is my join model)
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
      #All models have validations
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
      #The def feed method creates a feed with wines created by followed users. URL: /users/:id/feed.
- [x] Include signup (how e.g. Devise)
      #Users can sign up
- [x] Include login (how e.g. Devise)
      #Users can log in
- [x] Include logout (how e.g. Devise)
      #Users can log out
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
      #Users can sign up/log in with Facebook
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
      #users/id/followers, or users/id/following
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
      #wines/:wine_id/comments/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
      #validation errors display on form

Confirm:
- [x] The application is pretty DRY
      #check
- [x] Limited logic in controllers
      #check check
- [x] Views use helper methods if appropriate
      #check
- [x] Views use partials if appropriate
      #check check check
