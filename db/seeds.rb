eve, nahir, laura = User.create(
  [
    {
      email: "eve@mail.com",
      username: "eve",
      password: 123_456,
      password_confirmation: 123_456
    },
    {
      email: "nahir@mail.com",
      username: "nahir",
      password: 123_456,
      password_confirmation: 123_456
    },
    {
      email: "laura@mail.com",
      username: "laura",
      password: 123_456,
      password_confirmation: 123_456
    },
  ]
)

post_1 = eve.posts.create(body: "This is the first post")
post_2 = nahir.posts.create(body: "This is the second post")
post_3 = laura.posts.create(body: "This is the third post")

eve.like!(post_1)
nahir.like!(post_1)
laura.like!(post_2)
eve.like!(post_3)

laura.comments.create(post: post_1, body: "This is something at the first comment")
eve.comments.create(post: post_1, body: "This is something at the second comment")
laura.comments.create(post: post_2, body: "This is something at the third comment")

