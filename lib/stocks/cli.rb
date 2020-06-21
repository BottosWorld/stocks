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
        puts "Coming soon, If you know your stock's ticker, you can type 'symbol' to receive more information on that stock."
        puts "Once you are done, please type exit to close the program."
        input = gets.strip
        if input.downcase == "ticker"
            self.api.ticker_api
            list_ticker
            main_menu
        elsif input.downcase == "symbol"
            puts "Please enter the stock symbol/ticker you chose. Example: 'AAPL'."
            insert_stock_symbol(input)
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
        Stocks::Ticker.all.each_with_index{|ticker, i| puts "#{i}. #{ticker.description} ~ #{ticker.symbol}"}
    end

    def insert_stock_symbol(input)
        input = gets.strip
        if input.upcase
            self.api.profile_api(input)
            main_menu
        elsif input.downcase == "main menu"
            main_menu
        else
            puts "Invalid stock symbol, please try again or enter 'main menu' to go to the main menu and enter 'ticker' to see a list of valid symbols."
        end
    end

    def 

    def invalid
        puts "Invalid entry, please try again."
    end

end