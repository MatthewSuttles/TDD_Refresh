require 'rails_helper'

RSpec.describe AuthorsController, type: :controller do

  describe "GET #index" do
    it "assigns the authors object to @authors variable" do
      author1 = Fabricate(:author)
      author2 = Fabricate(:author)
      get :index
      expect(assigns(:authors)).to match_array([author1,author2])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    let(:author){author = Fabricate(:author)}

    it "find author with given id and assign to @author variable" do
      get :show, id: author
      expect(assigns(:author)).to eq(author)
    end

    it "renders the show template" do
      get :show, id: author
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new author object to @author variable" do
      get :new
      expect(assigns(:author)).to be_instance_of(Author)
    end
    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end
  end

end
