require 'csv'
require_relative '../models/order'

class OrderRepository
  CSV_OPTIONS = { headers: :first_row, header_converters: :symbol }

  def initialize(csv_file, meal_repository, employee_repository, customer_repository)
    @csv_file = csv_file
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    @orders = []
    load if File.exists?(@csv_file)
    @next_id = @orders.empty? ? 1 : @orders.last.id + 1
  end

  def add(order)
    order.id = @next_id
    @orders << order
    @next_id += 1
    save
  end

  def all
    @orders
  end

  def find(id)
    @orders.select { |order| order.id == id }.first
  end

  def undelivered_orders
    @orders.select { |order| !order.delivered? }
  end

  def find_by_employee(employee)
    @orders.select { |order| order.employee.id == employee.id }
  end

  def save
    CSV.open(@csv_file, 'wb', CSV_OPTIONS) do |csv|
      csv << [:id, :meal_id, :employee_id, :customer_id, :delivered]
      @orders.each do |order|
        csv << [order.id, order.meal.id, order.employee.id, order.customer.id, order.delivered]
      end
    end
  end


  private

  def load
    CSV.foreach(@csv_file, CSV_OPTIONS) do |row|
      id = row[:id].to_i
      meal_id = row[:meal_id].to_i
      meal = @meal_repository.find(meal_id)
      employee_id = row[:employee_id].to_i
      employee = @employee_repository.find(employee_id)
      customer_id = row[:customer_id].to_i
      customer = @customer_repository.find(customer_id)
      delivered = row[:delivered] == 'true'

      order = Order.new(id: id, meal: meal, employee: employee, customer: customer, delivered: delivered)

      @orders << order
    end
  end


end