class RedditPostsController < ApplicationController
  before_action :set_reddit_post, only: [:show, :edit, :update, :destroy]

  # GET /reddit_posts
  # GET /reddit_posts.json
  def index
    @reddit_posts = RedditPost.all
  end

  # GET /reddit_posts/1
  # GET /reddit_posts/1.json
  def show
  end

  # GET /reddit_posts/new
  def new
    @reddit_post = RedditPost.new
  end

  # GET /reddit_posts/1/edit
  def edit
  end

  # POST /reddit_posts
  # POST /reddit_posts.json
  def create
    @reddit_post = RedditPost.new(reddit_post_params)

    respond_to do |format|
      if @reddit_post.save
        format.html { redirect_to @reddit_post, notice: 'Reddit post was successfully created.' }
        format.json { render :show, status: :created, location: @reddit_post }
      else
        format.html { render :new }
        format.json { render json: @reddit_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reddit_posts/1
  # PATCH/PUT /reddit_posts/1.json
  def update
    respond_to do |format|
      if @reddit_post.update(reddit_post_params)
        format.html { redirect_to @reddit_post, notice: 'Reddit post was successfully updated.' }
        format.json { render :show, status: :ok, location: @reddit_post }
      else
        format.html { render :edit }
        format.json { render json: @reddit_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reddit_posts/1
  # DELETE /reddit_posts/1.json
  def destroy
    @reddit_post.destroy
    respond_to do |format|
      format.html { redirect_to reddit_posts_url, notice: 'Reddit post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reddit_post
      @reddit_post = RedditPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reddit_post_params
      params.require(:reddit_post).permit(:subreddit, :text, :url)
    end
end
