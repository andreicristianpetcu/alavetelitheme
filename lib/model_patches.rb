# coding: utf-8
# Add a callback - to be executed before each request in development,
# and at startup in production - to patch existing app classes.
# Doing so in init/environment.rb wouldn't work in development, since
# classes are reloaded, but initialization is not run each time.
# See http://stackoverflow.com/questions/7072758/plugin-not-reloading-in-development-mode
#
Rails.configuration.to_prepare do
    OutgoingMessage.class_eval do
        # Add intro paragraph to new request template
        def default_letter
            return nil if self.message_type == 'followup'
            "prin grija compartimentului de informare şi relaţii publice:

Nu vă supăraţi,
Conform Legii nr. 544/2001 privind liberul acces la informaţiile de interes public, doresc să primesc câte o copie a documentelor oficiale care conţin următoarele informaţii:




Sunt dispus să plătesc taxele aferente serviciilor de copiere pentru documentele solicitate (dacă solicitaţi copii imprimate pe suport fizic, de hârtie, de exemplu--în acest caz, nu uitaţi să completaţi adresa de corespondenţă sub semnatură)."
        end
    end
end
