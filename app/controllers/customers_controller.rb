require_relative '../views/customers_view'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomersView.new
  end

  def list
    # get all customers in repository
    customers = @customer_repository.all
    # show customers
    @view.display(customers)

  end

  def add
    # ask customer name
    name = @view.ask_name
    # ask customer address
    address = @view.ask_address
    # instantiate new customer
    customer = Customer.new(name: name, address: address)
    # add customer to repository
    @customer_repository.add(customer)
  end

end