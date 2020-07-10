class Stock < ApplicationRecord
    def self.new_lookup(ticker_symbol)
        # use self so that you can use it without create a new instance
        client = IEX::Api::Client.new(
            publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],
            endpoint: 'https://sandbox.iexapis.com/v1')
        return client.price(ticker_symbol)
    end

end
