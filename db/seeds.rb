User.create!(
  first_name: "Admin",
  last_name: "A",
  email: 'admin@gmail.com' ,
  password: 'password' ,
  password_confirmation: 'password',
  admin: true
)
User.create!(
  first_name: "User",
  last_name: "U",
  email: 'user@gmail.com' ,
  password: 'password' ,
  password_confirmation: 'password',
  admin: false
)

