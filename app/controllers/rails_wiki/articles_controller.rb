require_dependency "rails_wiki/application_controller"

module RailsWiki
  class ArticlesController < ApplicationController
    def index
      @articles = Article.order(:slug).paginate per_page: 20, page: params[:page]
    end


    def new
      @article = Article.new
    end

    def show
      @article = Article.friendly.find(params[:id])
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)

      if !@article.text.blank?
        article_body_after_wiki_links = @article.text.gsub(/\[(?<link>\w[\w\s]+)\]\s/) do
          link = Regexp.last_match[:link]
          "[#{link}](/wiki/#{link.parameterize})"
        end
      end

      @markdown_body = markdown.render(article_body_after_wiki_links || '')
      @versions_available = true if @article.versions.count > 1

    rescue ActiveRecord::RecordNotFound => ex
      @article = Article.new(title: params[:id],text: "Article wasn't found, want to create one?")
    end

    def create
      @article = Article.new(article_params)

      @article.save
      redirect_to @article
    end

    def edit
      @article = Article.friendly.find(params[:id])
    end

    def versions
      require 'differ'
      Differ.format = :html


      @article = Article.friendly.find(params[:id])
    end

    def update
      @article = Article.friendly.find(params[:id])
      if @article.update_attributes article_params
        redirect_to @article, notice: 'All good!'
      else
        render :edit
      end
    end

    private

    def article_params
      params.require(:article).permit(:title, :text, :version, :references, :protected)
    end
  end
end
