class ArticlesController < ApplicationController

	def index
		@articles = Article.includes(:user)
		@articles.sort! { |x,y| y.get_votes <=> x.get_votes }
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		@article.user_id = current_user.id
		if @article.save
			flash[:notice] = 'Article submitted'
			redirect_to article_path(@article)
		else
			flash.now[:error] = @article.errors.full_messages.join(', ')
			render :new
		end
	end

	def show
		@article = Article.find(params[:id])
		@comment = Comment.new
		@comments = @article.comments.all
		@comments.sort! { |x,y| y.get_votes <=> x.get_votes }
	end

	def up_vote
	end

	private

	def article_params
		params.require(:article).permit(:title, :url, :user)
	end

end