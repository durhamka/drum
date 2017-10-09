require_relative 'controllers/menu_controller'

system 'clear'
puts "Welcome to Kinsey's SM-808!"
MenuController.new.main_menu
