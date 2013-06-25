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
  'You really fat.',
  'Seriously, you are fat.',
  'I fart in your general direction!',
  'You have a good face for radio'
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

get '/goodbye/:name/forever' do
  "Goodbye, #{params[:name]}. Forever!"
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

get '/fancy-insults' do
  @insult = INSULTS.sample

  erb :insult, :layout => :app
end

get '/piglatin/:word' do
  @word = params[:word]
  @result = piglatinize( @word )

  erb :piglatinized, :layout => :app
end

get '/piglatin' do
  erb :piglatin, :layout => :app
end

post '/piglatin' do
  words = params[:words_to_convert]
  piglatin_words = []

  words.split(/\s+/).each do |w|
    piglatin_words << piglatinize(w)
  end

  @word = words
  @result = piglatin_words.join(' ')

  erb :piglatinized, :layout => :app
end


def piglatinize(word)
  word = word.strip

  word =~ /^([^aeiou]+)(.+)/i
  result = ($1 ? $2 + $1 + "ay" : word + "ay")
end
