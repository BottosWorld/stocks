class Stocks::CLI
    attr_reader :api

    def initialize
        @api = Stocks::API.new
    end

    def run
        puts "Welcome to the US stocks program!"
        sleep(1)
        main_menu
    end

    def main_menu
        puts "Please type ticker for a list of stock symbols.."
        puts "Or, coming soon, you can type in the appropriate stock symbol you wish to receive today's value per share."
        puts "Once you are done, please type exit to close the program."
        input = gets.strip
        if input.downcase == "ticker"
            self.api.ticker_api
            list_ticker
            main_menu
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
        Stocks::Ticker.all.each_with_index {|ticker, i| puts "#{i}. #{ticker.description} ~ #{ticker.symbol}"}
    end

    def invalid
        puts "Invalid entry, please try again."
    end

end