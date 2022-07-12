role1 = Role.create(name: 'superadmin')
role2 = Role.create(name: 'college')
role3 = Role.create(name: 'student')

user1 = User.create(username: "superadmin",email: "superadmin@gmail.com",password: "123456")
user1.roles << role1