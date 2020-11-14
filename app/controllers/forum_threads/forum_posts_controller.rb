# The ForumPostsController class extends the ForumThreads class
# The ForumPostsController handles the functionalities of a ForumPost
class ForumThreads::ForumPostsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_forum_thread
  
    # Create a Forum Post
    def create
      @forum_post = @forum_thread.forum_posts.new forum_post_params
      @forum_post.user = current_user
  
      if @forum_post.save
        redirect_to forum_thread_path(@forum_thread, anchor: "forum_post_#{@forum_post.id}"), notice: I18n.t('forum_threads.forum_posts.create_success')
      else
        redirect_to @forum_thread, alert: I18n.t('forum_threads.forum_posts.create_fail')
      end
    end

    def new
      @forum_post = ForumPost.new
    end
    
    # Delete a Forum Post
    def destroy
      @forum_thread = ForumThread.find(params[:forum_thread_id])
      @forum_post = @forum_thread.forum_posts.find(params[:id])
      if @forum_post.destroy
        redirect_to forum_thread_path(@forum_thread), notice: I18n.t('forum_threads.forum_posts.delete_success')
      else
        redirect_to forum_thread_path(@forum_thread), notice: I18n.t('forum_threads.forum_posts.delete_fail')
      end
    end
  
    # Forum Post parameters (private)
    private
  
      def set_forum_thread
        @forum_thread = ForumThread.find(params[:forum_thread_id])
      end
  
      def forum_post_params
        params.require(:forum_post).permit(:body)
      end
  end