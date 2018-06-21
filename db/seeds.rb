# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seed Starts"

Tool.create!(name: "Zapier", description: "The easiest way to automate your work", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTU2B0bAgzdduS4ow2H_Mm482ViCEnrPMUAc3GfvxzakGAS0Cil",
              website_url: "https://zapier.com/", chrome_extension_url: "https://chrome.google.com/webstore/detail/zapier/ngghlnfmdgnpegcmbpgehkbhkhkbkjpj" )



Tool.create!(name: "Hubspot", description: "Sales and Marketing software", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSuOgd0HDIOfJbco8VhKHeqYGJWwpwGcM4ESNo_ms_acxeDkJs",
              website_url: "https://www.hubspot.fr/", chrome_extension_url: "https://chrome.google.com/webstore/detail/hubspot-sales/oiiaigjnkhngdbnoookogelabohpglmd" )


Tool.create!(name: "Lusha", description: "B2B contact information at your fingertips", image_url: "https://www.lusha.co/wp-content/uploads/2017/11/LogoDark.svg",
              website_url: "https://www.lusha.co/", chrome_extension_url: "https://chrome.google.com/webstore/detail/lusha/mcebeofpilippmndlpcghpmghcljajna" )

puts "Seed ends"
