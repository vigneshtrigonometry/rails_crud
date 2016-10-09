class ArticlesController < ApplicationController
  before_action :get_article, only: [:show, :edit, :update, :destroy]
  def index
    @message = "Welcome to blogs application"
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to action:'index'
      else
      render 'new'
    end
  end


  def show
    #raise params.inspect #it shows all paramters
  end

  def edit
  end

  def update
    if @article.update_attributes(article_params)
      redirect_to action:'index'
      else
      render 'edit'
    end

  end

  def destroy
    @article.destroy
    redirect_to action: 'index'
  end

  def delete
  end



  private
  def article_params
    params.require(:article).permit(:title,:description)
  end

  def get_article
    @article = Article.find(params[:id])
  end


end
