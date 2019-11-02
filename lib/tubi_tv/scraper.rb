class TubiTv::Scraper
    
    def self.scrape_movies
        @site = "https://tubitv.com/category/most_popular?tracked=1"
        @doc = Nokogiri::HTML(open(@site))
        @container = @doc.css(".Col.Col--4.Col--lg-3.Col--xl-1-5.Col--xxl-2")
        @container.each do |movie|
        title = movie.css(".JB9zq h3").text
        duration = movie.css(".yPcUu").text
        year = movie.css("._3BhXb").text
        genre = movie.css(".RmVOo").text
        movies_hash = {
            :title => title,
            :duration => duration,
            :year => year,
            :genre => genre,
        }
        TubiTv::Movies.new(movies_hash)
    end
    end
end


