class TubiTv::Description
    attr_accessor :desc, :movies

    @@all = []
    def initialize(desc)
        @desc = desc
        add_to_movies
        @@all << self
        binding.pry
    end

    def self.all
        @@all
    end

    def add_to_movies
        @movies.description << self unless @movies.description.include?(self)
    end
end