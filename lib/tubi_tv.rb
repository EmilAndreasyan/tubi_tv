require_relative "./tubi_tv/version"
require_relative "./tubi_tv/cli"
require_relative "./tubi_tv/scraper"
require_relative "./tubi_tv/movies"
# require_relative "./tubi_tv/event"
require_relative "./concerns/findable"

require "nokogiri"
require 'open-uri'
require "pry"
require 'colorize'
require 'colorized_string'

module TubiTv
  class Error < StandardError; end
  # Your code goes here...
  
  # def find_by_name(name)
  #   self.all.find {|movie| movie.name == name}
  # end
end
