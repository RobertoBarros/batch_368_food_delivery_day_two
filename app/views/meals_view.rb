class MealsView

  def ask_name
    puts "Enter the meal name:"
    gets.chomp
  end

  def ask_price
    puts "Enter the meal price:"
    gets.chomp.to_i
  end

  def display(meals)
    meals.each do |meal|
      puts "id: #{meal.id} | #{meal.name} $#{meal.price}"
    end
  end

end