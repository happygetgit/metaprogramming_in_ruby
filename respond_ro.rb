require 'ostruct'

class Author
  attr_accessor :first_name, :last_name, :genre

  def author
    OpenStruct.new(first_name: first_name, last_name: last_name, genre: genre)
  end

  def method_missing(method_name, *arguments, &block)
    # author_....
    if method_name.to_s =~ /author_(.*)/
      author.send($1, *arguments, &block)
    else
      super
    end
  end

  # def respond_to_missing?(method_name, include_private = false)
  #   method_name.to_s.start_with?('author_') || super
  # end
end

author = Author.new
author.first_name = "shalini"
author.last_name = "k"
author.genre = "computer science"

p author.first_name
p author.author_genre

 p author.respond_to?(:author_detals)
 p author.respond_to?(:detals)
