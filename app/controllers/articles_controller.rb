class ArticlesController < ApplicationController

  def index
    @search = Article.ransack(params[:q])
    @articles = @search.result(distinct: true)
  end

  def show
    @current_version = Article.find(params[:id]).latest_version
    @article_comments = Article.find(params[:id]).comments
    doc = Nokogiri::HTML.fragment(@current_version.content)
    @sections = []
    doc.css('h3').each do |h3|
      @sections << h3.content
      h3["id"] = h3.content
    end

    @current_version.content = doc
  end

  def new
    if current_user
      @article = Article.new
      @version = @article.versions.new
    else
      @error = "WOOF WOOF WOOF"
    end
  end

  def create
    if current_user
      @article = Article.new(creator: current_user)

      @new_version = @article.versions.new(article_params)
      @new_version.editor = current_user

      if @article.save && @new_version.save
        if @new_version.published == true
          redirect_to article_path(@article)
        else
          redirect_to '/'
        end
      else
        # Add logic to accoutn validations
      end

    end
  end

  def destroy
    article = Article.find(params[:id])
    versions = Version.where(article_id: article.id ).destroy_all
    # flash.notice = "Article '#{article.title}' deleted!"
    article.destroy

    redirect_to action: "index"
  end

  # def edit
  #   @article = Article.find(params[:id]).latest_version
  # end

  # def update
  #   @article_object = Article.find(params[:id])
  #   @article = @article_object.latest_version
  #   @article.update(article_params)

  #   # flash.notice = "Article '#{@article.title}' Updated!"

  #   redirect_to article_path(@article_object)
  # end

  private
  def article_params
    params.require(:version).permit(:title, :content, :published, :all_sources)
  end

end
