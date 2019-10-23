class TubiTv::Scraper
    def self.scrape
        site = "https://tubitv.com/category/most_popular?tracked=1"
        doc = Nokogiri::HTML(open(site))
    films = doc.css("div.Row")
    films.each do |film|
        title = film.css("h3").text
        duration = film.css("div.yPcUu").text
        puts title
        #Movie.new(title, duration)
    end
    end
end




