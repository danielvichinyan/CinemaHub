# The ForumThreadsController handles the Forum Threads functionality.
# It provides the necessary methods in order for the user to create, update and delete forum threads.
class ForumThreadsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_forum_thread, only: [:show, :edit, :update, :destroy]

  # The index page of the forum threads
  def index
    @q = ForumThread.search(params[:q])
    @forum_threads = @q.result(distinct: true).all.order("created_at DESC").paginate(:page => params[:page], :per_page => 4)
  end

  # Show a particular forum thread page
  def show
    @forum_post = ForumPost.new
  end

  # Show the create forum thread page
  def new
    @forum_thread = ForumThread.new
    @forum_thread.forum_posts.new
  end

  # Create a forum thread
  def create
    @forum_thread = current_user.forum_threads.new forum_thread_params
    @forum_thread.user_id = current_user.id

    respond_to do |format|
      if @forum_thread.save
        format.html { redirect_to @forum_thread, notice: I18n.t('forum_threads.new.create_success') }
        format.json { render :show, status: :created, location: @forum_thread }
      else
        format.html { render :new }
        format.json { render json: @forum_thread.errors, status: :unprocessable_entity }
      end
    end
  end

  # Delete a forum thread
  def destroy
    @forum_thread.destroy
    respond_to do |format|
      format.html { redirect_to forum_threads_url, notice: I18n.t('forum_threads.edit.delete_success') }
      format.json { head :no_content }
    end
  end

  def edit
  end

  # Update a forum thread
  def update
    respond_to do |format|
      if @forum_thread.update(forum_thread_params)
        format.html { redirect_to @forum_thread, notice: I18n.t('forum_threads.edit.update_success') }
        format.json { render :show, status: :ok, location: @forum_thread }
      else
        format.html { render :edit }
        format.json { render json: @forum_thread.errors, status: :unprocessable_entity }
      end
    end
  end

  # Forum thread params (private)
  private

    def set_forum_thread
      @forum_thread = ForumThread.find(params[:id])
    end

    def forum_thread_params
      params.require(:forum_thread).permit(:subject, :message, :banner)
    end
end
