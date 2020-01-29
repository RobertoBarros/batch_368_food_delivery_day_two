class SessionsView

  def ask_username
    puts "Enter your username:"
    gets.chomp
  end

  def ask_password
    puts "Enter your password:"
    gets.chomp
  end

  def wrong_credentials
    puts "Wrong Credentials. Try Again"
  end

  def correct_credentials
    puts "Logged In!"
  end

end