User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now )

StaticPage.create!(name: "About", content: "blank")
StaticPage.create!(name: "Contact", content: "blank")

unless Rails.env.production?
  User.create!(name:  "Non-admin User",
              email: "example@example.com",
              password:              "password",
              password_confirmation: "password",
              admin: false,
              activated: true,
              activated_at: Time.zone.now )
  30.times do |n|
    User.create!(name: Faker::Superhero.name,
      email: "user-#{n}@example.com",
      password_digest: User.digest('password'),
      activated: true,
      activated_at: Time.zone.now,
      admin: false)
  end

  def create_seed_post(published_at = Time.now.to_date)
    content = Faker::Lorem.paragraph
    title = Faker::Lorem.words.join(' ')
    section_title = Faker::Lorem.words.join(' ')
    section_content = Faker::Lorem.paragraph
    post = User.find(1).posts.create!(body: content, title: title, published_at: published_at)
    post.sections.create!(title: section_title, body: section_content)
  end

  15.times { create_seed_post }
  5.times { create_seed_post(nil) }
end
