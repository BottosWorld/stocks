    # puts "This is where you will find the company profile for a given stock.."
    # puts "Coming soon."

class Stocks::Company
    attr_accessor :exchange, :finnhubIndustry, :name, :weburl, :marketCapitalization, :ipo

    @@all = []

    def initialize(array)
        @@all.each do |key, value|
            puts "#{key}=, #{value}"
        end
        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self unless @@all.include?(self)
    end

    def self.create(array)
        profile = self.new(array)
        profile.save
        profile
    end

    def self.create_from_collection(array)
        array.each do |profile_hash|
            self.create(profile_hash)
        end
    end

end
