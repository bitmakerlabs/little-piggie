require 'sinatra'

COMPLIMENTS = [
  'Looking good! Have you lost weight?',
  'I like your shoes.',
  'Your pet loves you too much to ever run away.',
  'Your sneezes sound like a chorus of angels giggling.',
  'Your hair smells like freshly cut grass.',
  '8 out of 10 co-workers agree your desk is the cleanest.'
]

INSULTS = [
  'You fat.',
  'You really fat',
  'Seriously, you are fat.'
]

get '/' do
  'Hello World'
end

get '/compliments' do
  COMPLIMENTS.sample
end

get '/insults' do
  INSULTS.sample
end

get '/hello' do
  "Hello, #{params[:name]}!"
end

get '/goodbye/:name' do
  "Goodbye, #{params[:name]}!"
end

get '/current-time' do
  erb "<%= Time.now %>"
end

get '/template' do
  erb :index
end

get '/fancy-compliments' do
  @compliment = COMPLIMENTS.sample

  erb :compliment
end