require 'sinatra'
# brakets are not necessary
require 'sinatra/contrib/all' if development?
# for debugging

get '/hi' do
  puts "Hello World"
end
# puts only show up in terminal

get '/roll-die' do
  return "Rolling the die...#{rand(1...7)}"
  # with or without return is no different
end

get '/name/:first/:last' do
  #only symbol needs to be lowercase; routes(name) can be capital
  # return "Your name is", params.to_s
  ### result is ||| Your name is{"first"=>"YingYing", "last"=>"Chen"}  |||

  return "Your name is #{params[:first]} #{params[:last]}"

end

get '/friends/:number' do
  friends = ["joey", "Phoebe", "Monica", "Chanler", "Rachel", "Ross"]
  index = params["number"].to_i - 1
  return friends[index]
end

get '/square/:input_num' do
  num = params["input_num"].to_i
  return "Number squared is = #{num * num}"
end



### Same route only runs the first one
get'/pet/hello' do
  return "Hello Pet"
end

get'/pet/:name' do
  return "Hello #{params[:name]}"
end
