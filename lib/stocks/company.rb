    # puts "This is where you will find the company profile for a given stock.."
    # puts "Coming soon."

class Stocks::Company
    attr_accessor :exchange, :finnhubIndustry, :name, :weburl, :marketCapitalization, :ipo

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
        profile = self.new(hash)
        profile.save
        profile
    end

    def self.create_from_collection(array)
        array.each do |profile_hash|
            self.create(profile_hash)
        end
    end

    def self.all
        @@all
    end

end
