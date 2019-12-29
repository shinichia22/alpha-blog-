class  ArticlesController < ApplicationController
  def new
    @article =Article.new
  end
  def create
    # render plain: params[:article].inspect   #This code is without validation
    # @article =Article.new(article_params)  #This code is without validation
    # @article.save                             #This code is without validation
    # redirect_to article_path(@article)       #This code is without validation
    @article =Article.new(article_params)
    if @article.save 
      flash[:notice] = "Article has successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end

  def show
    @article=Article.find(params[:id])

  end

  end
private
  def article_params
    params.require(:article).permit(:title, :description)
  end



end 