class AuthorsController < ApplicationController
  before_action :set_author, except: [:index, :new, :create]

  def index
    @authors = Author.all
  end

  def show
    set_author
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:success] = "Author has been created"
      redirect_to @author
    else
      flash[:error] = "Author has not been created"
      render :new
    end
  end

  def edit
    set_author
  end

  def update
    set_author
    if @author.update_attributes(author_params)
      flash[:success] = "Author has been updated"
      redirect_to @author
    else
      flash[:error] = "Author has not been updated"
      render :edit
    end
  end

  def destroy
    set_author
    if @author.destroy
      flash[:success] = "Author has been deleted"
      redirect_to authors_path
    end

  end
  private

  def author_params
    params.require(:author).permit(:first_name, :last_name)
  end

  def set_author
    @author = Author.find(params[:id])
  end
end
