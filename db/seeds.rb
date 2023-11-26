puts "Seeding started"

user = User.create!(email: "jmychalm13@gmail.com", password: "password", password_confirmation: "password")

Post.create!([
  {title: "This is a test!", content: "This is a test post. I am testing this model and controller and seeding my database.", user_id: user.id},
  {title: "Lorem Ipsum", content: "This is another test post and also seeding the database. I should probably start copying and pasting this content or my fingers will get tired.", user_id: user.id},
  {title: "I love dogs", content: "I am really missing my dog today. I'm worried about her being all alone for two days. I'm excited to go home tomorrow.", user_id: user.id}
])

post = Post.last()
user = User.create!(email: "dan@test.com", password: "password", password_confirmation: "password")

Comment.create!([
  {content: "I really enjoyed reading your post.", user_id: user.id, post_id: post.id}
])

puts "Seeding complete"
