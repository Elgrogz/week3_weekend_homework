require_relative('../db/sql_runner')

class Customer

  attr_accessor :name, :funds
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @funds = options['funds']
    @id = options['id'].to_i if options['id']
  end

  def save
    sql = "INSERT INTO customers (name, funds) 
          VALUES ('#{@name}', #{@funds}) 
          RETURNING id;"
    customer = SqlRunner.run(sql).first
    @id = customer['id'].to_i
  end

  def delete
    sql = "DELETE FROM customer WHERE id = #{@id}"
    result = SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM customers;"
    result = SqlRunner.run(sql)
    return result.map {|hash| Customer.new(hash)}
  end

  def self.delete_all
    sql = "DELETE FROM customers;"
    result = SqlRunner.run(sql)
  end

  def update
    sql = "UPDATE customers 
          SET (name, funds, id) = ('#{name}', #{funds}, #{@id}) 
          WHERE id = #{@id};"
    result = SqlRunner.run(sql)
  end

  def film
    sql = "SELECT f.* FROM films f
          INNER JOIN tickets t
          ON f.id = t.film_id
          WHERE t.customer_id = #{@id};"
    return Film.get_many(sql)      
  end

  def ticket_count
    sql = "SELECT t.* FROM tickets t
          INNER JOIN customers c
          ON c.id = t.customer_id
          WHERE t.customer_id = #{@id};"
    return Ticket.get_many(sql).count
  end

  def self.get_many(sql)
    customers = SqlRunner.run(sql)
    result = customers.map { |customer| Customer.new(customer) }
    return result
  end

end
