require 'weather-underground'
class WeatherResponder
  def self.respond(event)
  	weather = WeatherUnderground::Base.new
    if event.message.downcase.include? "weather"
    	message = ""
  	  if event.message.downcase.include? "forecast"
  			weather.TextForecast(ENV['zipcode']).days.each { |day| message += "#{day.title}: #{day.text} \n\n"}
  	  else
  	  	today = weather.CurrentObservations(ENV['zipcode'])
  	  	message = "It is currently #{today.temperature_string} and #{today.weather.downcase}"
  	  end
  	  HipChatHelper.send_message(event.room, message)
  	  return true
  	else
  	  return false
  	end
  end
end