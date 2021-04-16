class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(id=params[:id])
    end

    def new
        @article = Article.new
    end

    def destroy
        @article = Article.find(params[:id])

        # Checking if article is owned by user
        if @article.users_id == current_user.id || current_user.isAdmin == 1
            @article.destroy
            redirect_to root_path
        else
            redirect_to root_path, notice: "Error Deleting! You are not the owner"
        end
      end

    def create
        @article = Article.new(article_params)
        @article.users_id = current_user.id
        # @article.users_id = 100  # Failed duo to forign key constrain
        if @article.save
            redirect_to @article
        else
            render :new
        end
    end

    def edit
        @article = Article.find(id=params[:id])  # Can also be written as  ---> @article = Article.find(params[:id])
        if @article.users_id == current_user.id || current_user.isAdmin == 1
            @article = Article.find(id=params[:id])  # Can also be written as  ---> @article = Article.find(params[:id])
        else
            redirect_to root_path, notice: "Error Editing! You are not the owner"
        end
    end

    def update
        @article = Article.find(id=params[:id])
            
        if @article.update(article_params)
          redirect_to @article
        else
          render :edit
        end
    end

    private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end
end
