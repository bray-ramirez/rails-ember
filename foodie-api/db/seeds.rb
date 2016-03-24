#
# Users
#
form = UserForm.new User.new
form.validate :name => 'Test User',
  :email => 'test@email.com',
  :password => 'password',
  :password_confirmation => 'password'

form.save
