class RedditsController < ApplicationController
  before_action :set_reddit, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /reddits
  # GET /reddits.json
  def index
    @reddits = Reddit.all
  end

  # GET /reddits/1
  # GET /reddits/1.json
  def show
  end

  # GET /reddits/new
  def new
    @reddit = Reddit.new
  end

  # GET /reddits/1/edit
  def edit
  end

  # POST /reddits
  # POST /reddits.json
  def create
    @reddit = Reddit.new(reddit_params)

    respond_to do |format|
      if @reddit.save
        format.html { redirect_to @reddit, notice: 'Reddit was successfully created.' }
        format.json { render :show, status: :created, location: @reddit }
      else
        format.html { render :new }
        format.json { render json: @reddit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reddits/1
  # PATCH/PUT /reddits/1.json
  def update
    respond_to do |format|
      if @reddit.update(reddit_params)
        format.html { redirect_to @reddit, notice: 'Reddit was successfully updated.' }
        format.json { render :show, status: :ok, location: @reddit }
      else
        format.html { render :edit }
        format.json { render json: @reddit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reddits/1
  # DELETE /reddits/1.json
  def destroy
    @reddit.destroy
    respond_to do |format|
      format.html { redirect_to reddits_url, notice: 'Reddit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reddit
      @reddit = Reddit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reddit_params
      params.require(:reddit).permit(:room, :subreddit)
    end
end
