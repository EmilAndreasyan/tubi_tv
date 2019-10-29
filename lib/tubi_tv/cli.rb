class TubiTv::CLI  #TubiTv is a module name

    def call
        puts ColorizedString["\nWelcome to TubiTv! Here you can find movies matching your mood!\n"].colorize(:color => :cyan, :background => :white)
        get_movies
        list_movies
        get_user_movie
        #filter_by_year(@input)
    end

    def get_movies
        TubiTv::Scraper.scrape_movies # call scrape_movies method from Scraper
        @movies = TubiTv::Movies.all #  retrieve scraped data from Movies.all and store it in @movies instance variable, so we could use it elsewhere
    end

    def list_movies
        @movies.each {|movie| puts "#{movie.title}"}
    end

    def get_user_movie
        puts "Which Movie are you looking for?".colorize(:green)
        @input = gets.strip.downcase # takes user's input
        find_by_title(@input) if valid_input(@input.to_s, @movies) # calls find_by_title methos with user's input as argument
       #show_movies(@input)
    end

    def find_by_title(input)
        if @movies.find do |movie|
            movie.title.downcase == input
        end
        puts "#{input}".capitalize.colorize(:cyan)
        puts "we have the movie you're looking for!"
        TubiTv::Scraper.scrape_description
        @description = TubiTv::Description.all
        else
            puts "no such movie"
        end
    end

    def valid_input(input, data)
        # find if the input matches to any of @movies title
        data.select do |movie|
            movie.title == input
        end
    end


    def filter_by_year(input)
        year = @movies.select do |movie|
            movie.year.split(/\(|\)/)[1].to_i >= input.to_i # \look for ( |or \look for ) /\(|\)/
        end
        year.each {|num| puts num.title}
    end

    def filter_by_genre(input)
        @movies.select do |movie|
            movie.genre == input
        end
    end

    def filter_by_year_and_genre
        filter_by_year(input) && filter_by_genre(input)
    end

    
    # def show_movies(input)

    #    movie = @movies[input.to_i]
    #    puts "#{movie.title}"
    # end

    def get_user_duration(input)
        #lists all the movies which duration is equal or more to user's input
        @movies.filter {|movie| movie.duration.to_i >= @input.to_i}
    end

    def get_description
        TubiTv::Description.add_to_movies
    end

    # def self.reset_all
    #     TubiTv::Movies.all.clear
    # end

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





    # from CLI live project build

    # def call
    #     puts "\nWelcome to TubiTv! Here you can find movies matching your mood!\n".colorize(:yellow)
    #     # get_months
    #     # list_months
    #     # get_user_month
    #     puts ColorizedString["This is light blue with red background"].colorize(:color => :light_blue, :background => :red)
    #     puts String.colors
    #     #puts String.color_samples
    #     # puts String.disable_colorization = false
    #     # puts String.disable_colorization = true
    # end

    # # def get_months
    # #     #to be scraped instead
    # #     #@months = ['July 2019', 'August, 2019', 'September 2019', 'October 2019'] 
    # #     EdenEvents::Scraper.scrape_months
    # #     @months = EdenEvents::Month.all
    # # end

    # def list_months
    #     puts 'choose a month to see events.'.colorize(:blue)
    #     @months.each.with_index(1) do |index, month|
    #      puts  "#{index}. #{month.name}"
    #     end
    # end

    # def get_user_month
    #     chosen_month = gets.strip.to_i # puts user's input into a variable
    #     show_events_for(chosen_month) if valid_input(chosen_month.to_i, @months)
    # end

    # def valid_input(input, data)
    #     input.to_i <= @months.length && input.to_i > 0
    # end

    # def show_events_for(chosen_month)
    #     month = @months[chosen_month - 1]
    #     month.get_events
    #     puts "Here are events for #{month.name}"
    #     month.events.each.with_index(1) do |event, index|
    #         puts "#{index}. #{event.name}"
    #     end 
    # end

end