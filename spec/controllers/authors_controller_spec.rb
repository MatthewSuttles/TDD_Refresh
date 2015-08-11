require 'rails_helper'

RSpec.describe AuthorsController, type: :controller do

  #____________INDEX______________
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

  #____________SHOW_________________
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

  #_____________NEW___________________
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

  #_____________CREATE__________________
  describe "POST #create" do
    let(:valid_author){Fabricate.attributes_for(:author)}
    let(:invalid_author){Fabricate.attributes_for(:author, first_name: nil)}

    context "a successful create" do
      it "saves the new author" do
        post :create, author: valid_author
        expect(Author.count).to eq(1)
      end

      it "should redirect to show action" do
        post :create, author: valid_author
        expect(response).to redirect_to author_path(Author.first)
      end

      it "sets the success flash message" do
        post :create, author: valid_author
        expect(flash[:success]).to eq("Author has been created")
      end
    end

    context "a unsuccessful create" do
      it "does not save the new author object with invalid inputs" do
        post :create, author: invalid_author
        expect(Author.count).to eq(0)
      end

      it "it renders the new template" do
        post :create, author: invalid_author
        expect(response).to  render_template :new
      end

      it "sets the error flash message" do
        post :create, author: invalid_author
        expect(flash[:error]).to eq("Author has not been created")
      end
    end
  end

  #__________EDIT__________________
  describe "GET #edit" do
    let(:author){Fabricate(:author)}

    it "finds the author with given id and assigns to @author variable" do
      get :edit, id: author
      expect(assigns(:author)).to eq(author)
    end

    it "renders the edit template" do
      get :edit, id: author
      expect(response).to render_template :edit
    end
  end

  #______________UPDATE________________
  describe "PUT #update" do
    context "successful update" do
      let(:author){Fabricate(:author)}
      let(:author_attributes){Fabricate.attributes_for(:author, first_name: 'Paul')}

      it "updates the modified author object" do
        put :update, author: author_attributes, id: author.id
        expect(Author.first.first_name).to eq('Paul')
      end

      it "redirects to the show action" do
        put :update, author: author_attributes, id: author.id
        expect(response).to redirect_to author_path(Author.first)
      end

      it "sets the success flash message" do
        put :update, author: author_attributes, id: author.id
        expect(flash[:success]).to eq("Author has been updated")
      end
    end

    context "unsuccessful update" do
      let(:author){Fabricate(:author, first_name: 'Paul')}
      let(:author_attributes){Fabricate.attributes_for(:author, first_name: nil)}

      it "updates the modified author object" do
        put :update, author: author_attributes, id: author.id
        expect(Author.first.first_name).to eq('Paul')
      end

      it "renders the edit action" do
        put :update, author: author_attributes, id: author.id
        expect(response).to render_template :edit
      end

      it "sets the error flash message" do
        put :update, author: author_attributes, id: author.id
        expect(flash[:error]).to eq("Author has not been updated")
      end
    end
  end

  #______________DESTROY___________________
  describe "DELETE #destroy" do
    let(:author){Fabricate(:author)}

    it "should delete the author with given id" do
      delete :destroy, id:author
      expect(Author.count).to eq(0)
    end

    it "sets flash message" do
      delete :destroy, id:author
      expect(flash[:success]).to eq("Author has been deleted")
    end

    it "redirects to index page" do
      delete :destroy, id:author
      expect(response).to redirect_to authors_path
    end
  end
end
