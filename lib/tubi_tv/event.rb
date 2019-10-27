class EdenEvets::Events
    attr_accessor :name, :key_info, :month #event belongs to month

    @@all = []

    def initialize(name, month)
        @name = name
        @month = month
        # notify month about the event
        add_to_month
        @@all << self
    end  

    def self.all
        @@all
    end

    def add_to_month
        @month.events << self unless @month.events.include?(self)
    end
    
    def key_info
        
    end
end