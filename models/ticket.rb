require_relative('../db/sql_runner')

class Ticket

  attr_accessor :customer_id, :film_id, :film_time
  attr_reader :id

  def initialize(options)
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
    @film_time = options['film_time'].to_i
    @id = options['id'].to_i if options['id']
  end

  def save
    sql = "INSERT INTO tickets (customer_id, film_id, film_time) 
          VALUES (#{@customer_id}, #{@film_id}, #{@film_time}) 
          RETURNING id;"
    film = SqlRunner.run(sql).first
    @id = film['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM tickets;"
    result = SqlRunner.run(sql)
    return result.map {|hash| Ticket.new(hash)}
  end

  def self.delete_all
    sql = "DELETE FROM tickets;"
    result = SqlRunner.run(sql)
  end

  def self.get_many(sql)
    tickets = SqlRunner.run(sql)
    result = tickets.map {|ticket| Ticket.new(ticket)}
    return result
  end

  def deduct_funds
    sql = "UPDATE customers c
          SET c.funds = c.funds - f.price
          INNER JOIN tickets t
          ON c.id = t.customer_id
          INNER JOIN films f
          ON f.id = t.film_id
          WHERE t.customer_id = #{@id};"
    result = SqlRunner.run(sql)
  end

end
