class Ticker < ActiveRecord::Base

    has_many :date_mentions


    def self.by_name name

        self.find_by(ticker_name: name)

    end


    def self.most_popular(limit=30)
        # tickers = self.date_mentions.order('date DESC')

        # self.order_by

    end

    def self.search_tickers search_string
        results = []
        Ticker.all.each do |ticker|
            if ticker.ticker_name.include? search_string
                results.append(ticker)
            end
        end
        results
    end

    def self.get_popular
        results = []
        Ticker.all.each do |ticker|
            entry = [ticker.date_mentions.count, ticker.ticker_name]
            results.append(entry)
        end
        results.sort

    end

    def mention_count

        self.date_mentions.count

    end

    def mentions_by_recent
        self.date_mentions.order('date DESC')
    end


    #These two are probably usually the same result
    #------------------------------------------------
    def mentions_by_outreach
        self.date_mentions.order('estimated_outreach DESC')
    end

    def mentions_by_mentions
        self.date_mentions.order('mentions DESC')
    end
    #------------------------------------------------

end