require('pry-byebug')
require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')


customer1 = Customer.new({'name' => 'Constatius Leandro', 'funds' => 50})
customer2 = Customer.new({'name' => 'Yngvei Hieu', 'funds' => 100})
customer3 = Customer.new({'name' => 'Kurt Russell', 'funds' => 20})
customer4 = Customer.new({'name' => 'Beniamin Gero', 'funds' => 70})
customer5 = Customer.new({'name' => 'Raja Sigismund', 'funds' => 55})
customer6 = Customer.new({'name' => 'Ciro Thankarat', 'funds' => 30})

customer1.save
customer2.save
customer3.save
customer4.save
customer5.save
customer6.save

film1 = Film.new({'title' => 'Arrival', 'price' => 10})
film2 = Film.new({'title' => 'Doctor Strange', 'price' => 7})
film3 = Film.new({'title' => 'Rogue One', 'price' => 15})

film1.save
film2.save
film3.save

ticket1 = Ticket.new({'customer_id' => 1, 'film_id' => 1, 'film_time' => 1800})
ticket2 = Ticket.new({'customer_id' => 2, 'film_id' => 1, 'film_time' => 1800})
ticket3 = Ticket.new({'customer_id' => 3, 'film_id' => 2, 'film_time' => 1800})
ticket4 = Ticket.new({'customer_id' => 4, 'film_id' => 2, 'film_time' => 1800})
ticket5 = Ticket.new({'customer_id' => 5, 'film_id' => 3, 'film_time' => 2100})
ticket6 = Ticket.new({'customer_id' => 6, 'film_id' => 3, 'film_time' => 2100})
ticket7 = Ticket.new({'customer_id' => 1, 'film_id' => 2, 'film_time' => 2100})
ticket8 = Ticket.new({'customer_id' => 2, 'film_id' => 3, 'film_time' => 2100})
ticket9 = Ticket.new({'customer_id' => 1, 'film_id' => 3, 'film_time' => 2200})
ticket10 = Ticket.new({'customer_id' => 2, 'film_id' => 1, 'film_time' => 2200})
ticket11 = Ticket.new({'customer_id' => 3, 'film_id' => 3, 'film_time' => 2200})
ticket12 = Ticket.new({'customer_id' => 4, 'film_id' => 3, 'film_time' => 2200})
ticket13 = Ticket.new({'customer_id' => 5, 'film_id' => 2, 'film_time' => 1900})
ticket14 = Ticket.new({'customer_id' => 6, 'film_id' => 1, 'film_time' => 2000})
ticket15 = Ticket.new({'customer_id' => 1, 'film_id' => 3, 'film_time' => 2030})


ticket1.save
ticket2.save
ticket3.save
ticket4.save
ticket5.save
ticket6.save  
ticket7.save
ticket8.save
ticket9.save
ticket10.save
ticket11.save
ticket12.save
ticket13.save
ticket14.save
ticket15.save

customer1.name = 'Jimmy Jojo'
customer1.update

film1.price = 12
film1.update

binding.pry
nil
