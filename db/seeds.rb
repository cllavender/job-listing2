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

# params.require(:job).permit(:title,
# :description,
# :wage_upper_bound,
# :wage_lower_bound,
# :contact_email,
# :is_hidden,
# :city,
# :location,
# :field,
# :require_time,)


create_jos = for i in 1..3 do
  Job.create!([title: "买星巴克咖啡",
    description:"星巴克摩卡、焦糖玛奇朵、拿铁、星冰乐各一杯",
    wage_upper_bound: rand(2..3)*10,
    wage_lower_bound: rand(1..10)*1,
    is_hidden: "false"
  ])
puts "3 Public jobs created."
