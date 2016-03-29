class VersionsController < ApplicationController

  def index
    @all_versions = Version.where(article_id: params[:article_id])
  end

  def show
    @version = Version.find(params[:id])
    doc = Nokogiri::HTML.fragment(@version.content)
    @sections = []
    doc.css('h3').each do |h3|
      @sections << h3.content
      h3["id"] = h3.content
    end

    @version.content = doc
  end

  def new
   if current_user
      @article = Article.find(params[:article_id])
      @version = Version.new
    else
      # Fix this
      @error = "ASDFDFRRDFASDFASDFASDFASDF"
    end
  end

  def create
    if current_user
      @article = Article.find(params[:article_id])

      v_params = version_params
      source_params = v_params.delete(:sources)
      p v_params
      @version = @article.versions.new(v_params)

      source_params.split(' ').each do |source|
        @version.sources.new(url: source)
      end

      @version.editor = current_user

      if @version.save
        redirect_to article_path(@article)
      else
        # Add logic to account validations
      end

    end
  end

  private
  def version_params
    params.require(:version).permit(:title, :content, :published, :categories, :sources)

  end

end
