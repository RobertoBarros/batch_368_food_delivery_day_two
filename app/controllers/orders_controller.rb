require_relative '../views/orders_view'
require_relative '../views/meals_view'
require_relative '../views/customers_view'

class OrdersController
  def initialize(meal_repository, employee_repository, customer_repository, order_repository)
    @order_repository = order_repository
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    @view = OrdersView.new
    @meals_view = MealsView.new
    @customers_view = CustomersView.new
  end


  def add
    # ask meal id
    @meals_view.display(@meal_repository.all)
    meal_id = @view.ask_meal_id
    meal = @meal_repository.find(meal_id)
    # ask customer id
    @customers_view.display(@customer_repository.all)
    customer_id = @view.ask_customer_id
    customer = @customer_repository.find(customer_id)
    # ask employee id
    @view.display_employees(@employee_repository.all_delivery_guys)
    employee_id = @view.ask_employee_id
    employee = @employee_repository.find(employee_id)
    # Instantiate order
    order = Order.new(meal: meal, employee: employee, customer: customer)
    # Add to repo
    @order_repository.add(order)
  end

  def list_my_orders(employee)
    # get all employee orders
    orders = @order_repository.find_by_employee(employee)
    # display orders
    @view.display(orders)
  end

  def list_my_undelivered(employee)
    orders = @order_repository.find_by_employee(employee).reject { |order| order.delivered? }
    # display orders
    @view.display(orders)
  end


  def list_undelivered_orders
    undelivered_orders = @order_repository.undelivered_orders
    @view.display(undelivered_orders)
  end

  def mark_as_delivered(employee)
    # show all employee order
    undelivered_orders = @order_repository.undelivered_orders
    @view.display(undelivered_orders)

    # ask order id
    order_id = @view.ask_order_id
    # Find order in repo
    order = @order_repository.find(order_id)
    # mark order as delivered!
    order.deliver!
    @order_repository.save
  end


end