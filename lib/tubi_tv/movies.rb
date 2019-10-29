class TubiTv::Movies
    attr_accessor :title, :duration, :year, :genre

    @@all = []
    def initialize(movies_hash)
        movies_hash.each do |key, value|
            self.send("#{key}=", value)
        end
        descriptions = []
        @@all << self
    end

    def self.all
        @@all.uniq
    end



    # # from CLI live project build
    # @@all = ['a', 'b', 'c']

    # def initialize(name)
    #     @name = name
    #     @events = []
    #     @@all << self
    # end

    # def get_events
    #     EdenEvents::Scraper.scrape_events(self)  if @events.empty
    # end
    

    # def self.all
    #     EdenEvents::Scraper.scrape_months if @@all.empty?
    #     @@all
    # end

end