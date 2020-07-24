class Stock < ApplicationRecord

    has_many :user_stocks
    has_many :user, through: :user_stocks

    validates :name, :ticker, presence: true

    def self.new_lookup(ticker_symbol)
        # use self so that you can use it without create a new instance
        client = IEX::Api::Client.new(
            publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],
            endpoint: 'https://sandbox.iexapis.com/v1')
        begin
            return new(ticker: ticker_symbol, 
                  name: client.company(ticker_symbol).company_name, 
                  last_price: client.price(ticker_symbol))
        rescue => exception
            return nil
        end
        # because this is within the Stock model, we don't have to use Stock.new
    end

    def self.check_db(ticker_symbol)
        where(ticker:ticker_symbol).first
    end
end
