require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'restclient'

																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																	

def get_all_the_mails_of_val_doise_townhalls()

	base_url 	= "http://annuaire-des-mairies.com/95/"

	stream 		= open(base_url)

	html 		= Nokogiri::HTML(stream.read)

	mairie 		= html.css('a').map { |link| link['href']  }
	
	results 	= mairie.map { |e| base_url + e }

	results 	= results[5..results.count]
	 
	 

		results.each do |var|
			
			stream 		= open(var)

			doc 		= Nokogiri::HTML(stream.read)
	
			city 		= doc.css(".lientitre").first.text

			email 		= doc.css('p:contains("@")').text

			contact = {city: city, email: email, var: var}
			
			puts contact

			
		end

																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																
end

 
puts get_all_the_urls_of_val_doise_townhalls()





