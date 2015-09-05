User.destroy_all
u1 = User.create :first_name => 'Alex', :email => 'alexandraswan@gmail.com', :is_house_admin => true, :is_admin => true, :password => 'chicken'
u2 = User.create :first_name => 'Jamie', :email => 'jamie@test.com', :is_house_admin => true, :password => 'chicken'
u3 = User.create :first_name => 'Eve', :email => 'eve@test.com', :password => 'chicken'
u4 = User.create :first_name => 'Alice', :email => 'alice@test.com', :password => 'chicken'
u5 = User.create :first_name => 'James', :email => 'james@test.com', :password => 'chicken'

Room.destroy_all
r1 = Room.create :description => 'Front Room', :occupant => 'Jamie', :rent => 160
r2 = Room.create :description => 'Big Room', :occupant => 'James and Alice', :rent => 220
r3 = Room.create :description => 'Upstairs Left', :occupant => 'Alex', :rent => 180
r4 = Room.create :description => 'Upstairs Right', :occupant => 'Eve', :rent => 180

Home.destroy_all
h1 = Home.create :address => '191 Australia Street', :description => 'House'
h2 = Home.create :address => '217 Cullens Rd', :description => 'House'

h1.rooms << r1 << r2 << r3 << r4

r1.users << u2
r2.users << u4 << u5
r3.users << u1
r4.users << u3
