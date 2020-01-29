class OrdersView

  def ask_meal_id
    puts "Enter the meal id:"
    gets.chomp.to_i
  end

  def ask_customer_id
    puts "Enter the customer id:"
    gets.chomp.to_i
  end

  def ask_employee_id
    puts "Enter the employee id:"
    gets.chomp.to_i
  end

  def ask_order_id
    puts "Enter the order id:"
    gets.chomp.to_i
  end

  def display(orders)
    orders.each do |order|
      puts "id: #{order.id} | #{order.customer.name} | #{order.employee.username} | #{order.meal.name}"
    end
  end

  def display_employees(delivery_guys)
    delivery_guys.each do |delivery_guy|
      puts "id: #{delivery_guy.id} | #{delivery_guy.username}"
    end
  end




end