class TubiTv::Scraper
    def self.scrape_movies
        site = "https://tubitv.com/category/most_popular?tracked=1"
        doc = Nokogiri::HTML(open(site))
        container = doc.css("div.Row")
        container.each do |movie|
        film = movie.css("div.FeNml")
        title = movie.css("div.JB9zq h3").text
        duration = movie.css("div.yPcUu").text
        year = movie.css("div._3BhXb").text
        genre = movie.css("div.RmVOo").text
    
        TubiTv::Movies.new(film, title, duration, year, genre)  
        # movies_hash = {
        #     :film => film
        #     :title => title
        #     :duration => duration
        #     :year => year
        #     :genre => genre
        # }
        # TubiTv::Movies.new(movies_hash)

    end
    end

    # def self.scrape_events(month)
    #     EdenEvents::Event.new('cool event', month)
    #     EdenEvents::Event.new('uncool event', month)
    # end

#use hash
# input = gets.strip.downcase

end


