class ArticlesController < ApplicationController
  def index
    @article = Article.all
  end

  def show
    get_params_id
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(user_params)
    @article.save
    redirect_to article_path(@article)
  end

  def edit
    get_params_id
  end

  def update
    get_params_id
    @article.update(user_params)
    redirect_to article_path(@article)
  end

  def destroy
    get_params_id
    @article.destroy
    redirect_to articles_path
  end

  private
  #methode qui definit les variables pouvant etre modifie par le user => plus secure
  def user_params
    params.require(:article).permit(:title, :content)
  end

  def get_params_id
    @article = Article.find(params[:id])
  end

end
