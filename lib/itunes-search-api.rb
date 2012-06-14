require 'httparty'

class ITunesSearchAPI
  include HTTParty
  base_uri 'http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/wa'
  format :json

  class << self
    def search(query={})
      get("/wsSearch", :query => query)["results"]
    end

    def lookup(query={})
      if results = get("/wsLookup", :query => query)["results"]
        if results[0].length == 1
          results[0]
        else
          results
        end
      end
    end
  end
end
