require_relative '../views/meals_view'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealsView.new
  end

  def list
    # get all meals in repository
    meals = @meal_repository.all
    # show meals
    @view.display(meals)

  end

  def add
    # ask meal name
    name = @view.ask_name
    # ask meal price
    price = @view.ask_price
    # instantiate new meal
    meal = Meal.new(name: name, price: price)
    # add meal to repository
    @meal_repository.add(meal)
  end

end