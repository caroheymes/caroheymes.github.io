require 'bundler'
Bundler.require

require 'rubygems'
require 'nokogiri'
require 'open-uri'

def fonction

	base_url 	= "http://www.annuaire-des-mairies.com/pyrenees-orientales.html"

	stream 				= open(base_url)

	html 				= Nokogiri::HTML(stream.read)

	mairie 				= html.css('a').map { |link| link['href'].gsub("./", "http://www.annuaire-des-mairies.com/") } 

	mairie 				= mairie[8..mairie.count]
	
	mairie.each do |var|
			
				stream 		= open(var)

				doc 		= Nokogiri::HTML(stream.read)
	
				city 		= doc.css(".lientitre").first.text

				email 		= doc.css('p:contains("@")').text.gsub(" ", "")

				contact 	= {city: city, email: email, var: var}
				#p contact

				#Authenticate a session with my Service Account
				session 	= GoogleDrive::Session.from_service_account_key("client_secret.json")

				# Get the spreadsheet by its ID & first worksheet
				ws = session.spreadsheet_by_key("1t9c9-OUZ8AC5AHPGXuIPhB-CXzQbWie36Ibfz_FjhuQ").worksheets[0]
				
				# Print out the first 3 columns of each row
				ws.rows.each { |row| puts row.first(3).join(" | ") }
				
				ws.insert_rows(ws.num_rows + 1, [[city, email, var]])

				ws.save
				end



end
	fonction()

	