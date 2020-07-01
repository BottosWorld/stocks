 # puts "This is where you will find pricing quotes for the stock symbol.."

class Stocks::Quote
    
    @@all = []

    def initialize(array)
        array.each do |key, value|
            puts "#{key} | $#{value}"
        end
        save
    end


    def self.all
        @@all
    end

    def save
        @@all << self unless @@all.include?(self)
    end

    def self.create(hash)
        quote = self.new(hash)
        quote.save
        quote
    end

    def self.create_from_collection(array)
        array.each do |quote_hash|
            self.create(quote_hash)
        end
    end

end
