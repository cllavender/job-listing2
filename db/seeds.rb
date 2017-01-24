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
    is_hidden: "false",
    city:"上海",
     location:"静安区",
      field: "跑腿",
      require_time: DateTime.parse("02/05/2017 9:00")
  ])
end
puts "3 Public jobs created."


create_jos = for i in 1..3 do
  Job.create!([title: "帮忙遛狗", description:"拉普拉多狗狗 2岁", wage_upper_bound: rand(3..10)*10, wage_lower_bound: rand(1..3)*10, is_hidden: "false", city:"北京", location:"朝阳区", field: "其它",  require_time:DateTime.parse("02/05/2017 18:00")])
end
puts "3 Public jobs created."

create_jos = for i in 1..3 do
  Job.create!([title: "帮忙遛狗", description:"拉普拉多狗狗 2岁", wage_upper_bound: rand(3..10)*10, wage_lower_bound: rand(1..3)*10, is_hidden: "true", city:"北京", location:"朝阳区", field: "其它",  require_time:DateTime.parse("02/05/2017 18:00")])
end
puts "3 Public jobs created."

create_jos = for i in 1..5 do
  Job.create!([title: "帮忙买生煎", description:"拉普拉多狗狗 2岁", wage_upper_bound: rand(3..10)*10, wage_lower_bound: rand(1..3)*10, is_hidden: "false", city:"上海", location:"浦东区", field: "跑腿",  require_time:DateTime.parse("06/02/2017 8:00")])
end
puts "5 Public jobs created."

create_jos = for i in 1..2 do
  Job.create!([title: "上门烧菜",
    description:"家宴，20菜，10荤10素2汤2甜品",
    wage_upper_bound: rand(50..99)*100,
    wage_lower_bound: rand(10..49)*10,
    is_hidden: "false",
    city:"广州",
    location:"海珠区",
    field: "食",
    require_time: DateTime.parse("02/04/2017 14:00")
    ])
end
puts "3 Public jobs created."

create_jos = for i in 1..10 do
  Job.create!([title: "洗衣服", description: "洗衣服、烘干、熨衣服、叠整齐", wage_upper_bound: rand(5..20)*10, wage_lower_bound: rand(2..4)*10,is_hidden: "false",city:"上海", location:"静安区", field: "衣",  require_time:DateTime.parse("02/05/2017 20:00")])
end
puts "10 Hidden jobs created."

create_jos = for i in 1..10 do
  Job.create!([title: "代理男友", description: "回家过年，见父母，同城", wage_upper_bound: rand(5..20)*10, wage_lower_bound: rand(2..4)*10,is_hidden: "false",city:"成都", location:"武侯区", field: "其它",  require_time:DateTime.parse("27/01/2017 9:00")])
end
puts "10 Hidden jobs created."
