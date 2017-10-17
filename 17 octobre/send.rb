require 'gmail'
require 'google_drive'


#class WebAgent
#  class Cookie < HTTP::Cookie
#    def domain
#      self.original_domain
#    end
#  end
#end

def all_lines
	# Authenticate a session with your Service Account
	session = GoogleDrive::Session.from_service_account_key("client_secret.json")

	#Get the spreadsheet by its title
	ws = session.spreadsheet_by_key("1S1mh6JZHOMljTk2xBPHUSaHrf4CGFOq_1TMGLvy5ygM").worksheets[0]

	#send every row to the gmail sender
	thp_spam(ws.rows)
end



def thp_spam(ws)
	Gmail.connect("kro line", 'Aucun@2014') do |gmail|
		puts gmail.logged_in?
		ws.each do |row|
			gmail.deliver do
				to row[9]
				subject "La transformation digitale c'est un sujet pour #{row[5]}"
				html_part do
					content_type 'text/html; charset=UTF-8'
					body "<p>A l'attention de #{row[5]}, Maire de #{row[8]},

Bonjour,

Est-ce que vous vous êtes déjà demandé comment booster le développement économique de #{row[8]} et accompagner efficacement la transformation digitale de votre territoire ?

,<br><br>Le digital est aujourd'hui un levier de développement stratégique, pour la ville, comme pour les #{row[8]} habitants.<br>
Si vous cherchez des actions court terme qui marchent sur ces problématiques, sans financement public, les fondateurs de THP seront heureux de vous accompagner.<br>
                                    </td>
 Charles, co-fondateur du projet pourra répondre à toutes vos questions LD : 06 95 46 60 80</p>"
			 	end
			end
		sleep(3)
		end
	end
end
end
all_lines()



