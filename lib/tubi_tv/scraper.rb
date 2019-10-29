class TubiTv::Scraper
    
    def self.scrape_movies
        @site = "https://tubitv.com/category/most_popular?tracked=1"
        @doc = Nokogiri::HTML(open(@site))
        @container = @doc.css(".Col.Col--4.Col--lg-3.Col--xl-1-5.Col--xxl-2")
        @container.each do |movie|
        #binding.pry
        title = movie.css("div.JB9zq h3").text
        duration = movie.css("div.yPcUu").text
        year = movie.css("div._3BhXb").text
        genre = movie.css("div.RmVOo").text
        movies_hash = {
            :title => title,
            :duration => duration,
            :year => year,
            :genre => genre,
        }
        TubiTv::Movies.new(movies_hash)
    end
    end

    def self.scrape_description
        binding.pry
        @doc.each do |movie|
            desc = movie.css("._1_hc6").text
            TubiTv::Description(desc)
        end
    end
    # def self.scrape_events(month)
    #     EdenEvents::Event.new('cool event', month)
    #     EdenEvents::Event.new('uncool event', month)
    # end

#use hash
# input = gets.strip.downcase

end


