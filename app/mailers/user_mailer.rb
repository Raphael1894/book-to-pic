class UserMailer < ApplicationMailer
  default from: 'myself'
 
  def welcome_email
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user


    #on définit une variable @url qu'on utilisera dans la view d’e-mail


    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: "rapha.pereira.perso@gmail.com", subject: 'Image generated !') 
  end
end
