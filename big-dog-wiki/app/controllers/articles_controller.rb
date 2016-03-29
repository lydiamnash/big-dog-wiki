class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    @pic = @article.pictures.new
  end

  def create

  @article = Article.new(article_params)

  respond_to do |format|
    if @article.save

      if params[:images]
        #===== The magic is here ;)
        params[:images].each { |image|
          @article.pictures.create(image: image)
        }
      end

      format.html { redirect_to @article, notice: 'Gallery was successfully created.' }
      format.json { render json: @article, status: :created, location: @article }
    else
      format.html { render action: "new" }
      format.json { render json: @article.errors, status: :unprocessable_entity }
    end

    redirect_to article_path(@article)
  end
end

  def destroy
    article = Article.find(params[:id])
    # flash.notice = "Article '#{article.title}' deleted!"
    article.destroy

    redirect_to action: "index"
  end

  def edit
    @article = Article.find(params[:id])

  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    # flash.notice = "Article '#{@article.title}' Updated!"

    redirect_to article_path(@article)
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end

end
