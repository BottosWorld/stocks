class Stocks::API

    attr_accessor :base_url, :profile, :quote, :api_key, :ticker

    def initialize
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
    end

    def profile_api(symbol)
        @pro_api = @base_url << @profile << "#{symbol}" << @api_key
        response = RestClient.get(@pro_api)
        json = JSON(response)
        # company_profile = json.each {|key, value| puts value}
        profile_array = []
        profile_array << json
        # profile_array << company_profile
        Stocks::Company.create_from_collection(profile_array)
    end

    def quote_api(symbol)
        # Coming soon!
    end

end