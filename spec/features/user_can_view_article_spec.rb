require 'rails_helper'

feature "User can view an article" do

  let(:article) { FactoryGirl.create(:article, title: "Bananas") }
  background { visit article_path(article) }

  scenario "it shows an articles' details" do
    expect(page).to have_content(article.title)
    expect(page).to have_content(article.description)
  end

  scenario "it shows a form for adding a comment" do
    expect(page).to have_content("Add a comment:")
    expect(page).to have_css("form[action='#{article_comments_path(article)}']")

  end

  scenario "it creates a new comment" do
    fill_in "comment_content", with: "This is a content for a comment."
    click_button("Create comment")

    expect(Comment.last.content).to eq("This is a content for a comment.")
    # expect(Comment.last.article_id).to eq(article.id)

    # raise Comment.last.methods.sort.inspect
    expect(Comment.last.article).to eq(article)
  end


  scenario "it shows comments on the article page" do
    # working on site, why not here??
    fill_in "comment_content", with: "This is a content for a comment."
    click_button("Create comment")
    expect(page).to have_content("This is a content for a comment.")

  end
end












