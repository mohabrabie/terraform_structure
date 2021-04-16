class CommentsController < ApplicationController

    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        @comment.users_id = current_user.id
        @comment.save
        redirect_to article_path(@article)
    end

    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])

        # Checking if article is owned by user
        if @comment.users_id == current_user.id || current_user.isAdmin == 1
            @comment.destroy
            redirect_to article_path(@article)
        else
            redirect_to article_path(@article), notice: "Error Deleting Comment! You are not the owner"
        end

    end

    def edit
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        if @comment.users_id != current_user.id && current_user.isAdmin == 0
            redirect_to article_path(@article), notice: "Error Editing Comment! You are not the owner"
        end
    end
    
    def update
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        if @comment.update(comment_params)
            redirect_to @article
        else
            render :edit
        end
    end
    
    

    private
        def comment_params
            params.require(:comment).permit(:commenter, :body, :status)
        end

end
