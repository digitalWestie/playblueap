# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed

#Create User Roles
Role.create(:title => 'Refinery')
Role.create(:title => 'Superuser')

#Assign user roles
user = User.new(email: "admin@admin.com")
user.password = "password"
user.save
user.roles << Role.find_by_title('Refinery')
user.roles << Role.find_by_title('Superuser')
user.save

p = Refinery::Page.create(title: "hashtags", slug: "hashtags")
Action::CATEGORIES.each do |hashtag, name| 
  x = p.parts.build(title: hashtag, body: "<h2>#{name}</h2>Fusce tempor, erat eget laoreet aliquet, tellus metus eleifend lorem, id rhoncus felis est at ante. 
    Curabitur quis est lorem. Vivamus mollis molestie auctor. In venenatis blandit dui, at fringilla ligula varius posuere. 
    Suspendisse potenti. Sed a posuere metus, eu ornare neque. Donec tempus ac metus ornare facilisis. 
    Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. ")
  x.save
end

x = p.parts.build(title: "all", body: "<h1>BlueAp</h1><img src='http://cdni.condenast.co.uk/646x430/a_c/bologna_cnt_9nov09_istock_b_1.jpg' style='float:left; margin:1em;'></img>Fusce tempor, erat eget laoreet aliquet, tellus metus eleifend lorem, id rhoncus felis est at ante. 
  Curabitur quis est lorem. Vivamus mollis molestie auctor. In venenatis blandit dui, at fringilla ligula varius posuere. 
  Suspendisse potenti. Sed a posuere metus, eu ornare neque. Donec tempus ac metus ornare facilisis. 
  Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. ")
x.save