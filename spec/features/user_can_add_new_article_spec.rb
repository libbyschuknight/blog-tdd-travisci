require 'rails_helper'

RSpec.feature "User can add new article" do

  background do
    visit new_article_path
    fill_in "Title", with: "First new blog post"
    fill_in "Description", with: "This is the content part of my first blog post. This is where the main part of the blog post is written."
  end


  scenario "user can add title & description to form and submit" do
    click_button("Submit Article")

    expect do
      expect(page).to have_content("First new blog post")
      expect(page).to have_content("This is the content part of my first blog post. This is where the main part of the blog post is written.")
    end
  end

  scenario "once user submits form they are redirected to article page" do
    expect {
      click_button("Submit Article")
    }.to change {Article.count}.by(1)

    expect do
      expect(current_path).to eql(new_article_path)
      expect(page.current_page).to have_content("First new blog post")
    end

  end
end
