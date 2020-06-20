# loads our environment file

require "rest-client"
require "json"
require "pry"

module Stocks
  class Error < StandardError; end
  # Your code goes here...
end

require_relative "./stocks/version"
require_relative "./stocks/api"
require_relative "./stocks/company"
require_relative "./stocks/cli"