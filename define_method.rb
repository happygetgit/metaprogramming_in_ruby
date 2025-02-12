class Author

  # Below is the  define_method syntax in metaprogramming

  # define_method("some_method") do
  #   puts "Some details"
  # end

  # def fiction_details(arg)
  #   puts "Fiction"
  #   puts arg
  #   puts "asddfdsfd"
  # end

  # def coding_details(arg)
  #   puts "coding"
  #   puts arg
  #   puts "asddfdsfd"
  # end

  # def history_details(arg)
  #   puts "history"
  #   puts arg
  #   puts "asddfdsfd"
  # end

  # instead of creating the above multiple method this is a simple way of combining the methods
  genres = %w(fiction coding history)

    genres.each do |genre|
      define_method("#{genre}_details") do |arg|
        puts genre
        puts arg
        puts "sdfdsfdsfsdf" 
        puts genre.object_id
      end
    end

end

author = Author.new
author.fiction_details("love")
p author.respond_to?(:coding_details)