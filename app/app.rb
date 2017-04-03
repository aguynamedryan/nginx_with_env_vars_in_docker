require 'sinatra'

get '/env' do
  ENV.sort.map{ |k,v| "<strong>#{k}</strong>:#{v}" }.select { |l| l =~ /#{params[:q]}/i }.join("<br><br>")
end
