eve, nahir, laura = User.create(
  [
    {
      email: "eve@mail.com",
      password: 123_456,
      password_confirmation: 123_456
    },
    {
      email: "nahir@mail.com",
      password: 123_456,
      password_confirmation: 123_456
    },
    {
      email: "laura@mail.com",
      password: 123_456,
      password_confirmation: 123_456
    },
  ]
)

post_1 = eve.posts.create(body: "This is the first post")
post_2 = nahir.posts.create(body: "This is the second post")
post_3 = laura.posts.create(body: "This is the third post")
