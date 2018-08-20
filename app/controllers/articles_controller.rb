class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :show, :update, :destroy] # run the set_article method in the private section before running the given show, edit, update & delete methods. DRY
  
  def index
    @articles = Article.all
  end
  
  def new
    @article  = Article.new  
  end
  
  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    # @article.save
    # redirect_to article_path(@article)
    
    if @article.save
      flash[:notice] = "Article saved successfully"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  
  def show
    
  end
  
  def edit
    
  end
  
  def update
    if @article.update(article_params)
      flash[:notice] = "Article updated successfully"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
    
  def destroy
    @article.destroy
    flash[:notice] = "Article deleted successfully"
    redirect_to articles_path
  end
  
  
  private
  def article_params
    params.require(:article).permit(:title, :description)  
  end
  
  def set_article
    @article = Article.find(params[:id])
  end
  
end
