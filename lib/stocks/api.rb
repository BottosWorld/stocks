class Stocks::API

    attr_accessor :base_url, :profile, :quote, :api_key, :ticker

    def initialize
        # self.base_url = "https://finnhub.io/api/v1/stock/symbol?exchange=US&token=brm2kafrh5re8ma1q70g"
        @base_url = "https://finnhub.io/api/v1"
        @profile = "/stock/profile2?symbol="
        @ticker = "/stock/symbol?exchange=US&token=brm2kafrh5re8ma1q70g"
        @quote = "/quote?symbol="
        @api_key = "&token=brm2kafrh5re8ma1q70g"
    end

    def ticker_api
        response = RestClient.get(@base_url + @ticker)
        json = JSON(response)
            ticker_array = []
            json.each do |hash|
                ticker_hash = {}
                ticker_hash[:description] = hash["description"]
                ticker_hash[:symbol] = hash["symbol"]
                ticker_array.push(ticker_hash)
            end
        Stocks::Ticker.create_from_collection(ticker_array)
        # binding.pry
    end

    def profile_api(symbol)
        @pro_api = @base_url << @profile << "#{symbol.downcase}" << @api_key
        response = RestClient.get(@pro_api)
        json = JSON(response)
        # binding.pry
    end

    def quote_api(symbol)

    end

end

    # def query(information)
    #     response = RestClient.get(self.base_url + information + api_key)
    #     json = JSON(response)
    #     # binding.pry
    #     @base_url = "https://finnhub.io/api/v1"
    #     @ticker = "/stock/symbol?exchange=US"
    #     @quote = "/quote?symbol=#{symbol}"
    #     @profile = "/stock/profile2?symbol=#{symbol}"
    #     @api_key = "&token=brm2kafrh5re8ma1q70g"
    #     if user_input == "ticker"
    #         @url = @base_url << @ticker << @api_key
    #     elsif user_input == "quote"
    #         @url = @base_url << @quote << Stocks::CLI.symbol << @api_key
    #     else 
    #         @url = @base_url << @profile << Stocks::CLI.symbol << @api_key
    #     end
    # end



# api url will look like this: "base_url" + "information" + "api_key"

# base url = https://finnhub.io/api/v1

# information =
# /stock/profile2?symbol=#{user_input} - company class
# /quote?symbol=#{user_input} - quote class
# /stock/symbol?exchange=US - ticker class

# api key = &token=brm2kafrh5re8ma1q70g