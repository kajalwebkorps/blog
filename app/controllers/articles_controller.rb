class ArticlesController < ApplicationController
  
  # /articles
  def index
  	@articles = Article.all
    #render json: @articles
  end

  def all_article
    index
  end

  def show
  	@article = Article.find(params[:id])
  end

  def new
  	@article = Article.new
  end

  def create
    index   #master
  	@article = Article.new(article_params)
    respond_to do |format|
    	if @article.save
    		format.js
    	else
    		format.html { render :new }
    	end
    end
  end

  def edit
  	@article = Article.find(params[:id])
  end

  def update
  	@article = Article.find(params[:id])
  	if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
  	@article = Article.find(params[:id])
  	@article.destroy
  	redirect_to root_path
  end

  private
  def article_params
  	params.require(:article).permit(:title, :body, :status)
  end
end
