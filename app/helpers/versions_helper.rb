module VersionsHelper

  def version_sources(article)
    source_urls = article.latest_version.sources.map { |source| source.url }
    source_urls.join(' ')
  end


end
