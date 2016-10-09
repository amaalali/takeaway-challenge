class Restaurant

  def initialize
    @menu = [{dish: 'fries', price: 1.0}, {dish: 'fish', price: 1.5}]
    @current_order = Array.new
    @total = 0
    #TODO add option to initialize with yaml file
  end

  def read_menu
    greeting

    k=1
    @menu.each do |item|
      puts "#{k}. #{item[:dish]} ... £#{item[:price]} "
      k+=1
    end

    instructions
  end

  def select(item_number, amt =1)
    fail "You entered a number that does not corespond to our menu :( Please try again." if (item_number -1) > @menu.length
    fail "You entered an invalid quantity. Enter a number for the quantity" if !amt.is_a?(Numeric)
    selection = {dish: @menu[item_number-1][:dish], price: @menu[item_number-1][:price], quantity: amt}
    @current_order << selection
  end

  def cart
    puts "Your cart has the following:"
    @current_order.each do |selection|
      puts "#{selection[:quantity]} x #{selection[:dish]} = £#{selection[:quantity]*selection[:price]}"
    end
  end

  def total
    @total = 0
    @current_order.each do |selection|
      @total += selection[:quantity]*selection[:price]
    end
    "Your total is £#{@total}"
  end

  private

  def greeting
    "Welcome! Here are the items that we have and their prices"
  end

  def instructions
    "To add an item to your cart type 'resturant_name.select(item_number, quantity)'"
  end

  def finish
    @final_order = @current_order.each_with_object(Hash.new(0)) { |word,counts| counts[word] += 1 }
  end
end