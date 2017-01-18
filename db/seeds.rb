# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "這個種子檔會自動建立一個admin帳號, 並且創建 10 個 public jobs, 以及10個hidden jobs"

create_account = User.create([email: 'elizachen34@gmail.com', password: '888888', password_confirmation: '888888', is_admin: 'true'])
puts "Admin account created."

create_jos = for i in 1..3 do
  Job.create!([title: "Job no.#{i} 帮买星巴克摩卡", description: "這是用種子建立的第 #{i} 個Public工作", wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*10, is_hidden: "false"])
end
puts "3 Public jobs created."

create_jos = for i in 1..3 do
  Job.create!([title: "Job no.#{i} 帮忙遛狗", description: "這是用種子建立的第 #{i} 個Public工作", wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*10, is_hidden: "false"])
end
puts "3 Public jobs created."

create_jos = for i in 1..2 do
  Job.create!([title: "Job no.#{i} 上门煲汤", description: "這是用種子建立的第 #{i} 個Public工作", wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*10, is_hidden: "false"])
end
puts "3 Public jobs created."

create_jos = for i in 1..10 do
  Job.create!([title: "Job no.#{i+10} 面谈", description: "這是用種子建立的第 #{i+10} 個Hidden工作", wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*100,is_hidden: "true"])
end
puts "10 Hidden jobs created."
