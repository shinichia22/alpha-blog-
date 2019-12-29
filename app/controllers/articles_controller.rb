class  ArticlesController < ApplicationController
  def index
    @any_name =Article.all
  end

  def new
    @article =Article.new
  end

  def edit
    @article=Article.find(params[:id])
  end


  def create
    # render plain: params[:article].inspect   #This code is without validation
    # @article =Article.new(article_params)  #This code is without validation
    # @article.save                             #This code is without validation
    # redirect_to article_path(@article)       #This code is without validation
    @article =Article.new(article_params)  # this is taken from the new action
    if @article.save 
      flash[:notice] = "Article has successfully created"
      redirect_to article_path(@article)  #Show path
    else
      render 'new'
    end
  end
  
  def update  
    @article = Article.find(params[:id])  # This is taken care from the edit action
    if @article.update(article_params)  # as in routes it shows that it take arguments we add the arguments
      flash[:notice] = "Article has been successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end


  def show
    @article=Article.find(params[:id])
  end

  def destroy
    @article=Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article has successfully deleted"
    redirect_to articles_path

  end


private
  def article_params
    params.require(:article).permit(:title, :description)
  end



end 