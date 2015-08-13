require 'rails_helper'

feature "User can view a list of articles on home page," do
  background do
    Article.destroy_all
    FactoryGirl.create(:article, title: "First post!", description: "Kia ora.. Morningside for life, this cool housie is as kiwi as as a pretty suss hongi. Mean while, in West Auckland, Jim Hickey and Rhys Darby were up to no good with a bunch of crook mates. The outrageously awesome force of his cooking up a feed was on par with James and the Giant Peach's bung cookie time. Put the jug on will you bro, all these random hangis can wait till later.")
    FactoryGirl.create(:article, title: "Last post!")
  end

  scenario "it shows a list of articles" do
    # refactor out to be in the background block at top??
    visit articles_path(@artciles)

    expect(page).to have_content("First post!")
    expect(page).to have_content("Last post!")
    expect(page).to have_content("Kia ora.. Morningside for life, this cool...")
  end

  scenario "and user clicks title and is redirected to article page" do
    visit articles_path(@articles)
    click_on("First post!")

    expect(page).to have_content("First post!")
    expect(page).to have_content("Kia ora.. Morningside for life, this cool housie is as kiwi as as a pretty suss hongi. Mean while, in West Auckland, Jim Hickey and Rhys Darby were up to no good with a bunch of crook mates. The outrageously awesome force of his cooking up a feed was on par with James and the Giant Peach's bung cookie time. Put the jug on will you bro, all these random hangis can wait till later.")
  end

  scenario "and user clicks add article link, redirected to new article page" do
    visit articles_path(@articles)
    click_on("Add Article")

    expect(page).to have_content("New Article")
  end

end



