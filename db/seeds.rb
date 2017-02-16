# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
User.create([
    { fname:"Ashley", lname:"A", email:"aa@gmail.com", password:"123" },
    { fname:"Lauren", lname:"B", email:"lb@gmail.com", password:" abc" },
    { fname:"Jermaine", lname:"C", email:"jc@gmail.com", password:" 456" },
    { fname:"Timmy", lname:"D", email:"td@gmail.com", password:"def" }
])

Post.delete_all
Post.create([
    { user_id:"1", title:"FirstPost", content:"adjbdjbadj" },
    { user_id:"2", title:"SecondPost", content:"jfjnfljks" },
    { user_id:"3", title:"ThirdPost", content:"lmnlkfnvbsljkd" },
    { user_id:"4", title:"FourthPost", content:"bhjkbdubnksbksjhfb" },
    { user_id:"4", title:"FifthPost", content:"bhjkbdubnksbksjhfb" }
])

Comment.delete_all
Comment.create([
    { user_id:"1", post_id:"2", content:"hfdljhjs" },
    { user_id:"2", post_id:"2", content:"kn;ksn" },
    { user_id:"2", post_id:"3", content:"lhdldiwohfckn" },
    { user_id:"3", post_id:"4", content:"knlkwbjw" }
])
