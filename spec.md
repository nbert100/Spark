# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
*using Rails code to build app (ex: rails g resource to build models, rails g new to initially build app)*
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
*Suitor has many meetings and User has many meetings*
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
*Meetings belongs_to User and belongs_to Suitor*
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
*Suitor has_many users through meetings and User has many suitors through meetings*
- [ ] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
*More than one - location, venue, rating*
- [ ] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [x] Include signup (how e.g. Devise)
*Homepage*
- [x] Include login (how e.g. Devise)
*Homepage*
- [x] Include logout (how e.g. Devise)
*Homepage*
- [ ] Include third party signup/login (how e.g. Devise/OmniAuth)
- [ ] Include nested resource show or index (URL e.g. users/2/recipes)
- [ ] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
- [ ] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate