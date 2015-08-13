require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  before do
    Article.destroy_all
  end

  describe "#show" do

    before do
      @article = FactoryGirl.create(:article)
    end

    it "finds an article" do
      get :show, id: @article.id
      expect(assigns(:article).id).to eq(@article.id)
    end

    context "when article doesn't exist" do
      before {get :show, id: @article.id-1}

      it "redirects to home page" do
        expect(response).to redirect_to(root_path)
      end

      it "sets an error message in flash" do
        expect(flash[:error]).to_not be_nil
      end

    end
  end

  describe "#index" do

    before do
      # fix line below up, so that only creating up to 3 articles rather than 10
      @articles = FactoryGirl.create_list(:article, 10)
    end

    it "finds a list of articles" do
      get :index, articles: @articles
      expect(assigns(:articles)).to eq(@articles)
    end
  end


  describe "#new" do

    before do
      get :new
    end

    it "returns new article page" do
      expect(response).to render_template(:new)
    end

    it "assigns instance of Article to @article" do
      expect(assigns(:article)).to be_an_instance_of(Article)
    end
  end


  describe "#create" do

    context "if valid parameters" do

      before do
        @valid_params = FactoryGirl.attributes_for(:article)
        post :create, {:article => @valid_params}
        @article = Article.find_by(@valid_params)
      end

      it "a new article is created" do
        expect(@article).to be_truthy
      end

      it "redirects to show article details" do
        expect(response).to redirect_to(article_path(@article))
      end
    end

    context "if invalid parameters" do

      before do
        @invalid_params = FactoryGirl.attributes_for(:article, title: "", description: "")
        # Article.create(title: "", description: "")
        post :create, {:article => @invalid_params}
        @article = Article.find_by(@invalid_params)
      end

      it "a new artcile is not created" do
        expect(@article).to be_falsey
      end

      it "redirects to the new article page" do
        expect(response).to redirect_to(new_article_path)
        # expect(response).to redirect_to("/articles/new")

      end
    end
  end
end

























