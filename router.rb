class Router

  def initialize(sessions_controller, meals_controller, customers_controller, orders_controller)
    @sessions_controller = sessions_controller
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @orders_controller = orders_controller
  end

  def run

    employee = @sessions_controller.sign_in

    loop do
      if employee.manager?
        option = manager_options
        case option
        when 1 then @meals_controller.add
        when 2 then @meals_controller.list
        when 3 then @customers_controller.add
        when 4 then @customers_controller.list
        when 5 then @orders_controller.list_undelivered_orders
        when 6 then @orders_controller.add
        end

      else
        option = delivery_guy_options
        case option
        when 1 then @orders_controller.list_my_undelivered(employee)
        when 2 then @orders_controller.mark_as_delivered(employee)
        end
      end

    end
  end

  def manager_options
    puts "-" * 80
    puts '1. Add Meal'
    puts '2. Show All Meals'
    puts '3. Add Customer'
    puts '4. Show All Customers'
    puts '5. Show Undelivered Orders'
    puts '6. Create Order'
    puts "-" * 80
    puts "Enter option:"
    puts "-" * 80
    choice = gets.chomp.to_i
  end

  def delivery_guy_options
    puts '-' * 80
    puts "1. Show my undelivered order"
    puts "2. Mark order as delivered"
    puts "-" * 80
    puts "Enter option:"
    puts "-" * 80
    choice = gets.chomp.to_i
  end

end