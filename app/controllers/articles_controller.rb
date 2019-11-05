class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(task_params)
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(task_params)
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    @article.destroy

    redirect_to articles_path
  end

  private

  def task_params
    # params[:task] -> permit title, details, completed
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
