module TubiTv
    module InstanceMethods
        def initialize(name) # in module instance methods self.class is added in the body
            self.class.name = name
            save
        end

        def save
            self.class.all << self
        end

    end
    module ClassMethods # in module class methods are written without self., self. is added in the body and refers to each class it is called from
        def reset_all
            self.all.clear
        end

        def find_by_name(name)
            self.all.find {|movie| movie.name == name}
        end

        def create_by_name(name)
           movie = self.new(name)
           movie.save
           movie
        #    self.new(name).tap do |movie|
        #    end
        end

        def find_or_create_by_name(name)
            find_by_name(name) || create_by_name(name)
        end
        
    end
end