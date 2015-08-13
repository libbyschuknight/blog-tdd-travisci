require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  before do
    # destroy comments??
  end

  describe "#create" do
    before do
      @article = FactoryGirl.create(:article)
      new_comment = FactoryGirl.create(:comment, article_id: @article, content: "this is a comment")

      @comment = Comment.find_by_id(new_comment.id)
    end

    it "a new comment is created" do
      expect(@comment).to be_truthy
    end

  end
end
