class TubiTv::CLI  #TubiTv is a module name

    def call
        puts ColorizedString["\nWelcome to TubiTv! What would you like to do?\n"].colorize(:color => :cyan, :background => :white)
        get_movies # this method should be put first, to initiate scraping and so that @movies called by it is recognizable
        puts <<-DOC.strip
            1. If you want to list all the movies
            2. If you want to filter movies by year
            3. If you want to filter movies by year range
            4. If you want to filter movies by genre
            5. If you want to filter movies by both genre and year
            6. If you want to find movies by its title
        DOC
        @input = gets.strip.downcase.to_i
        options(@input)
        # puts String.colors
        # puts String.color_samples
        # puts String.disable_colorization = false
        # puts String.disable_colorization = true
    end

    def options(input)
        case input 
        when 1
            list_movies
        when 2
            filter_by_year(@input)
        when 3
            filter_by_year_range(@start, @finish)
        when 4
            filter_by_genre(@input)
        when 5
            filter_by_year_and_genre(@year, @genre)
        when 6
            find_by_title(@input)
    end
end



    def get_movies
        TubiTv::Scraper.scrape_movies # call scrape_movies method from Scraper
        @movies = TubiTv::Movies.all #  retrieve scraped data from Movies.all and store it in @movies instance variable, so we could use it elsewhere
    end

    def list_movies
        puts "Here is the list of all movies you can watch for free!".colorize(:green)
        sleep(2)
        #binding.pry
        @movies.each.with_index(1) {|movie, index| 
            if movie.title != ""
            puts "#{index}. #{movie.title} (#{movie.duration})"
        end }
        puts "There are #{@movies.count} movies in total"
    end

    def get_user_movie
        puts "Which Movie are you looking for?".colorize(:green)
        @input = gets.strip.downcase # takes user's input
        find_by_title(@input) if valid_input(@input.to_s, @movies) # calls find_by_title methos with user's input as argument
       #show_movies(@input)
    end

    
    def find_by_title(input)
        puts "Enter movie's title".colorize(:cyan)
        @input = gets.strip.downcase
        matching_movie = @movies.select do |movie|
            movie.title.downcase == @input
        end
        if !matching_movie.empty?
        puts "We have the movie you're looking for!"
        puts "#{@input}".capitalize.colorize(:cyan)
        else
            puts "Oops! We couldn't find anything for #{@input}. Try something else!"
        end
    end

    def valid_input(input, data)
        # find if the input matches to any of @movies title
        data.select do |movie|
            movie.title == input
        end
    end


    def filter_by_year(input)
        puts "please, insert year of a movie".colorize(:yellow)
        @input = gets.strip.downcase
        production_year = @movies.select do |movie|
            movie.year.split(/\(|\)/)[1].to_i >= @input.to_i # /start \look for ( |or \look for ) /end
        end
        puts "We have found #{production_year.length} movie(s) matching your search".colorize(:cyan)
        sleep(2)
        if !production_year.empty?
            production_year.each {|num| puts "#{num.title} (#{num.year.split(/\(|\)/)[1]})"}
        else
            puts "no matching movies after #{@input} year"
        end
    end

    def filter_by_year_range(start, finish)
        puts "type in starting year".colorize(:green)
        @start = gets.strip.to_i
        puts "type in ending year".colorize(:green)
        @finish = gets.strip.to_i
        range = @movies.select do |movie|
            movie.year.split(/\(|\)/)[1].to_i >= @start && movie.year.split(/\(|\)/)[1].to_i <= @finish
        end
        puts "There are #{range.length} movies from #{@start} to #{@finish}".colorize(:green)
        sleep(2)
        if !range.empty?
            range.each do |num| puts "#{num.title} (#{num.year.split(/\(|\)/)[1]})"
        end
        else
            puts "there are no movies between #{@start} and #{@finish} years"
        end
    end

    def filter_by_genre(input)
        puts "Type in the genre of movie you want to watch".colorize(:yellow)
        @input = gets.strip.downcase
        movie_genre = @movies.select do |movie|
            #binding.pry
            movie.genre.downcase.split(/\,|\ /)[0] == @input
        end
        if !movie_genre.empty?
            puts "We have found #{movie_genre.length} movies for #{@input.capitalize}".colorize(:yellow)
            sleep(2)
            movie_genre.each {|movie| puts "#{movie.title} (#{movie.genre.downcase})"} 
        else
            puts "Sorry, there are no movies for #{@input}. Try something esle!"
        end
    end

    def filter_by_year_and_genre(year, genre)
        puts "Enter the year of a movie you're looking for".colorize(:cyan)
        @year = gets.strip.to_i
        puts "Enter the genre".colorize(:cyan)
        @genre = gets.strip.downcase
        year_and_genre = @movies.select do |movie|
            #the condition doesn't work
            movie.year.split(/\(|\)/)[1].to_i >= @year && movie.genre.downcase.split(/\,|\ /)[0] == @genre            
        end 
        if !year_and_genre.empty?
            puts "We have found the #{year_and_genre.length} movie(s) for #{@genre.capitalize} produced since #{@year}".colorize(:green)                       
            year_and_genre.each do |movie|
                puts "#{movie.title} (#{movie.year.split(/\(|\)/)[1].to_i}, #{movie.genre.downcase})"            
            end
        else
        puts "We haven't found any movie(s) matching both #{@year} and #{@genre}"
        end
    end

    
    # def show_movies(input)
    #    movie = @movies[input.to_i]
    #    puts "#{movie.title}"
    # end

    # def get_description
    #     TubiTv::Description.add_to_movies
    # end

    def self.reset_all
        TubiTv::Movies.all.clear
    end

    # def create_by_name(name)
    #    movie = self.new(name)
    #    movie.save
    #    movie
    # #    self.new(name).tap do |movie|
    # #    end
    # end

    # def find_or_create_by_name(name)
    #     find_by_name(name) || create_by_name(name)
    # end
end