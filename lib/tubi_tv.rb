require_relative "./tubi_tv/version"
require_relative "./tubi_tv/cli"
require_relative "./tubi_tv/scraper"
require_relative "./tubi_tv/movie"
require_relative "../lib/concerns/findable"

require "nokogiri"
require 'open-uri'
require "pry"

module TubiTv
  class Error < StandardError; end
  # Your code goes here...
end
