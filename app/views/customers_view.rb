class CustomersView

  def ask_name
    puts "Enter the customer name:"
    gets.chomp
  end

  def ask_address
    puts "Enter the customer address:"
    gets.chomp
  end

  def display(customers)
    customers.each do |customer|
      puts "id: #{customer.id} | #{customer.name} | #{customer.address}"
    end
  end

end