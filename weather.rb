require 'sinatra'
require 'yahoo_weatherman'

client = Weatherman::Client.new

get '/' do
  erb :home
end

post '/weather' do
    @post = params[:post]['location']

    @weather = get_weather(post)

"#{@weather}"

    if (@weather == 'sunny')
        erb :sunny
    elsif (@weather == 'cloudy')
        erb :cloudy
    elsif (@weather == 'snowy')
        erb :snowy
    elsif (@weather == 'rainy')
        erb :rainy
    else
        erb :default
    end
end