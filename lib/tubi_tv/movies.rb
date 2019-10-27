class TubiTv::Movies
    attr_accessor :film, :title, :duration, :year, :genre
    attr_writer :events

    @@all = []
    def initialize(film, title, duration, year, genre)
        @film = film
        @title = title
        @duration = duration
        @year = year
        @genre = genre
        # @title = :title
        # @duration = :duration
        @@all << self
    end

    def self.all
        @@all
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