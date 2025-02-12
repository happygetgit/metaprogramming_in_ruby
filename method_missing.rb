require 'ostruct'

class Author
  attr_accessor :first_name, :last_name, :genre

  def author
    OpenStruct.new(first_name: first_name, last_name: last_name, genre: genre, details: ->(&block) { block.call("shalini's details") })
  end

  def method_missing(method_name, *arguments, &block)
    # author_....
    if method_name.to_s =~ /author_(.*)/
      author.send($1, *arguments, &block)
    else
      super
    end
  end
end

author = Author.new
author.first_name = "shalini"
author.last_name = "k"
author.genre = "computer science"

p author.first_name
p author.author_genre

p author.author_details{|info| puts "Info: #{info}"}