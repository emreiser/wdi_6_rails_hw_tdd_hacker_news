class ArticlesController < ApplicationController

	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def create
		article = Article.new(article_params)
		article.user_id = current_user.id
		if article.save
			redirect_to article_path(article)
		else
			render :new
		end
	end

	def show
		@article = Article.find(params[:id])
		@comments = @article.comments
	end

	private

	def article_params
		params.require(:article).permit(:title, :url, :user)
	end

end