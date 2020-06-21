#This is where you can find a list of companies with their stock symbol

class Stocks::Ticker
    attr_accessor :description, :symbol

    @@all = []

    def initialize(hash)
        hash.each do |key, value|
            self.send("#{key}=", value)
        end
    end

    def save
        @@all << self unless @@all.include?(self)
    end

    def self.create(hash)
        ticker = self.new(hash)
        ticker.save
        ticker
    end

    def self.create_from_collection(array)
        array.each do |ticker_hash|
            self.create(ticker_hash)
        end
    end

    def self.all
        @@all
    end

end