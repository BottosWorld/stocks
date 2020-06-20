class Stocks::API

    attr_accessor :base_url

    def initialize
        self.base_url = "https://finnhub.io/api/v1"
    end

    def query(information)
        response = RestClient.get(self.base_url + information)
        json = JSON(response)
        binding.pry
    end
    
    # puts "This will be where you code your API to properly get information for stocks"

end

# api url will look like this: "base_url" + "information" + "api_key"

# base url = https://finnhub.io/api/v1

# information =
# /stock/profile2?symbol=#{user_input}
# /stock/recommendation?symbol=#{user_input}
# /quote?symbol=#{user_input}

# api key = &token=brm2kafrh5re8ma1q70g