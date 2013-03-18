require "bundler/setup"
Bundler.require(:default)
require "sinatra/reloader"

class App < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    browser = Browser.new(:ua => request.user_agent)
    @mac = browser.mac?
    @entities = [
      {symbol: "’", name: "Apostrophe", shortcut: "option shift ]"},
      {symbol: "“", name: "Left Quote", shortcut: "option ["},
      {symbol: "”", name: "Right Quote", shortcut: "option shift ["},
      {symbol: "…", name: "Ellipsis", shortcut: "option ;"}
    ]
    slim :index
  end

end
