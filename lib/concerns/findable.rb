module Methods 
module InstanceMethods
    def initialize(name) 
        self.class.name = name # in module instance methods self.class is added in the body
        save
    end

    def save
        self.class.all << self
    end

end
module ClassMethods 
    def reset_all
        self.all.clear # in module class methods are written without self., 
        # self. is added in the body and refers to each class it is called from
    end

    def find_by_name(name)
        self.all.find {|movie| movie.name == name}
    end

    def create_by_name(name)
       movie = self.new(name)
       movie.save
       movie
    #    self.new.tap do |movie|
    #       movie.save = save
    #    end
    end

    def find_or_create_by_name(name)
        find_by_name(name) || create_by_name(name)
    end
end
end