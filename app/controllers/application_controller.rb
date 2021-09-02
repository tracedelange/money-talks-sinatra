class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    content_type 'text/html'
    """
    <h1>Money Talks API</h1>
    
    <h3>This api can be used to retrieve social media mentions about tradable market 'Ticker Symbols'</h3>

    <h3> Routes: </h3>
    <p><b>/tickers</b> --- Return a list of the top 30 tickers </p>
    <p><b>/tickers/name/:name</b> --- Return a specific ticker by name, upper or lowercase </p>
    <p><b>/tickers/id/:id</b> --- Return a specific ticker by ID </p>

    """
  end

  get "/tickers" do
    tickers = Ticker.all.order('ticker_name').limit(30)
    tickers.to_json
  end
  
  get "/tickers/name/:name" do
    ticker_name = params[:name].upcase
    ticker = Ticker.find_by ticker_name: ticker_name
    ticker.to_json(:methods => :mentions_by_recent)
  end
  
  get "/tickers/id/:id" do
    ticker_id = params[:id]
    ticker = Ticker.find(ticker_id)
    ticker.to_json(:methods => :mentions_by_recent)
  end

  get "/tickers/search/:name" do
    search_string = params[:name].upcase
    results = Ticker.search_tickers search_string
    results.to_json
  end

  get "/mentions/by-date/:date" do 

    date = params[:date]

    results = DateMention.order('estimated_outreach desc').where('date >  ?', date).limit(20)

    results.to_json(:include => :ticker)

  end

end
