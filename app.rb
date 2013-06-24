require 'sinatra'

COMPLIMENTS = [
  'Looking good! Have you lost weight?',
  'I like your shoes.',
  'Your pet loves you too much to ever run away.',
  'Your sneezes sound like a chorus of angels giggling.',
  'Your hair smells like freshly cut grass.',
  '8 out of 10 co-workers agree your desk is the cleanest.'
]

get '/' do
  COMPLIMENTS.sample
end