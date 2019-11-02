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
end