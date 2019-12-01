# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(firstName: "Admin", lastName: "Admin",email: "admin@gmail.com",address: "nyarugenge",bio: "developer",occupation: "diveintocode",expertise: "expertise",admin:true,mentor: false,password: "password",password_confirmation: "password") 
User.create!(firstName: "Mentor", lastName: "Mentor",email: "mentor@gmail.com",address: "nyarugenge",bio: "developer",occupation: "diveintocode",expertise: "expertise",admin:false,mentor: true,password: "password",password_confirmation: "password") 
User.create!(firstName: "Mentee", lastName: "Mentee",email: "mentee@gmail.com",address: "nyarugenge",bio: "developer",occupation: "diveintocode",expertise: "expertise",admin:false,mentor: false,password: "password",password_confirmation: "password")  
User.create!(firstName: "Cedru", lastName: "Kyitare",email: "cedru@gmail.com",address: "nyarugenge",bio: "developer",occupation: "diveintocode",expertise: "expertise",admin:false,mentor: true,password: "password",password_confirmation: "password") 
User.create!(firstName: "Adali", lastName: "abayiringira",email: "adali@gmail.com",address: "nyarugenge",bio: "developer",occupation: "diveintocode",expertise: "expertise",admin:false,mentor: false,password: "password",password_confirmation: "password") 
User.create!(firstName: "blaise", lastName: "uyisenga",email: "blaise@gmail.com",address: "nyarugenge",bio: "developer",occupation: "diveintocode",expertise: "expertise",admin:false,mentor: true,password: "password",password_confirmation: "password")  
User.create!(firstName: "DU", lastName: "claude",email: "du@gmail.com",address: "nyarugenge",bio: "developer",occupation: "diveintocode",expertise: "expertise",admin:false,mentor: true,password: "password",password_confirmation: "password") 
User.create!(firstName: "mere", lastName: "paul",email: "mere@gmail.com",address: "nyarugenge",bio: "developer",occupation: "diveintocode",expertise: "expertise",admin:false,mentor: true,password: "password",password_confirmation: "password") 
User.create!(firstName: "pere", lastName: "papa",email: "pere@gmail.com",address: "nyarugenge",bio: "developer",occupation: "diveintocode",expertise: "expertise",admin:false,mentor: true,password: "password",password_confirmation: "password") 
User.create!(firstName: "sheja", lastName: "colombe",email: "colombe@gmail.com",address: "nyarugenge",bio: "developer",occupation: "diveintocode",expertise: "expertise",admin:false,mentor: true,password: "password",password_confirmation: "password") 
User.create!(firstName: "kabeho", lastName: "marie",email: "kabeho@gmail.com",address: "nyarugenge",bio: "developer",occupation: "diveintocode",expertise: "expertise",admin:false,mentor: false,password: "password",password_confirmation: "password")      