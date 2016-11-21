require_relative('../db/sql_runner')

class Film

  attr_accessor :title, :price
  attr_reader :id

  def initialize(options)
    @title = options['title']
    @price = options['price']
    @id = options['id'].to_i if options['id']
  end

  def save
    sql = "INSERT INTO films (title, price) 
          VALUES ('#{@title}', #{@price}) 
          RETURNING id;"
    film = SqlRunner.run(sql).first
    @id = film['id'].to_i
  end

  def delete
    sql = "DELETE FROM films WHERE id = #{@id}"
    result = SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM films;"
    result = SqlRunner.run(sql)
    return result.map {|hash| Film.new(hash)}
  end

  def self.delete_all
    sql = "DELETE FROM films;"
    result = SqlRunner.run(sql)
  end

  def update
    sql = "UPDATE films 
          SET (title, price, id) = ('#{title}', #{price}, #{@id}) 
          WHERE id = #{@id};"
    result = SqlRunner.run(sql)
  end

  def customer
    sql = "SELECT c.* FROM customers c
          INNER JOIN tickets t
          ON c.id = t.customer_id
          WHERE t.film_id = #{@id};"
    return Customer.get_many(sql)
  end

  def self.get_many(sql)
    films = SqlRunner.run(sql)
    result = films.map {|film| Film.new(film)}
    return result
  end

  def punter_count
    sql = "SELECT c.* FROM customers c
          INNER JOIN tickets t
          ON c.id = t.customer_id
          WHERE t.film_id = #{@id}"
    return Customer.get_many(sql).count
  end

  #only returns one time even if there are two film_times with equal number of punters. not sure how i would make it that it returns all of them

  def most_popular_time
    sql = "SELECT t.* FROM tickets t
          INNER JOIN films f
          ON f.id = t.film_id
          WHERE t.film_id = #{@id};"
    tickets = Ticket.get_many(sql)
    film_times = tickets.map{|ticket| ticket.film_time}
    counts = Hash.new(0)
    film_times.each { |time| counts[time] += 1}
    return results.max_by {|time| counts[time]}
  end
  
end
