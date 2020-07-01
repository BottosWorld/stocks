class Stocks::CLI
    attr_accessor :api

    def initialize
        @api = Stocks::API.new
    end

    def run
        puts "Welcome to the US stocks program!"
        sleep(1)
        main_menu
    end

    def main_menu
        puts "Please type 'ticker' for a list of stock symbols.."
        puts "If you know your stock's ticker, you can type 'symbol' to receive more information on that stock."
        puts "To get a quote on a stock symbol, please type in 'quote' for today's trading value."
        puts "Once you are done, please type exit to close the program."
        input = gets.strip
        if input.downcase == "ticker"
            self.api.ticker_api
            list_ticker
            main_menu
        elsif input.downcase == "symbol"
            puts "Please enter the stock symbol/ticker you chose. Example: 'AAPL'."
            insert_stock_symbol
            Stocks::CLI.new.main_menu
            # main_menu does not work here, get a 401 "unauthorized access" error when requesting from api after initial get response.
        elsif input.downcase == "quote"
            puts "Please enter the stock symbol which you'd like a quote for."
            insert_quote_symbol
            Stocks::CLI.new.main_menu
        elsif input.downcase == "exit"
            puts "Thank you, come again!"
        else
            invalid
            main_menu
        end         
    end

    def list_ticker
        puts "Listing ticker, please wait.."
        sleep(1)
        Stocks::Ticker.all.each_with_index{|ticker, i| puts "#{i+1}. #{ticker.description} ~ #{ticker.symbol}"}
    end

    def insert_stock_symbol
        input = gets.strip
        if input.length < 5
            input.upcase.include?("#{input.upcase}")
            puts "Loading profile, please wait..."
            sleep(1)
            self.api.profile_api(input)
            # list_company_profile
            # binding.pry
        else
            puts "Invalid stock symbol, please try again or enter 'ticker' to see a list of valid symbols."
        end
    end

    def insert_quote_symbol
        input = gets.strip.upcase
        # .upcase is required in this method because the api requires the symbol to be in all caps for the quote unlike the company profile
            if input.length < 5
                input.upcase.include?("#{input.upcase}")
                puts "Loading todays stock prices."
                sleep(1)
                self.api.quote_api(input)
            else
                puts "Invalid stock symbol, please try again."
            end
        end


    # def list_company_profile
    #     sleep(1)
    #     Stocks::Company.all
    # end

    def invalid
        puts "Invalid entry, please try again."
    end

end