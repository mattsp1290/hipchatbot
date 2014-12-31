class HipChatEventsController < ApplicationController
  require 'json'
  before_action :set_hip_chat_event, only: [:show, :edit, :update, :destroy]
  protect_from_forgery with: :exception, :except => [:receive]

  def receive
    begin
      event = JSON.parse request.body.read
      @hip_chat_event = HipChatEvent.new(
        :webhook_type => event['event'],
        :date => event['item']['message']['date'],
        :mention_name => event['item']['message']['from']['mention_name'],
        :message => event['item']['message']['message'],
        :room => event['item']['room']['id'].to_i,
        :webhook_id => event['webhook_id'].to_i
      )
      respond_to do |format|
        if @hip_chat_event.save
          format.html { redirect_to @hip_chat_event, notice: 'Hip chat event was successfully created.' }
          format.json { render :show, status: :created, location: @hip_chat_event }
        else
          format.html { render :new }
          format.json { render json: @hip_chat_event.errors, status: :unprocessable_entity }
        end
      end
    rescue Exception => e
      Rails.logger.info 'Receive Event Rescue'
      Rails.logger.info e
      Rails.logger.info '------------'
      raise e
    end
  end
  # GET /hip_chat_events
  # GET /hip_chat_events.json
  def index
    @hip_chat_events = HipChatEvent.all
  end

  # GET /hip_chat_events/1
  # GET /hip_chat_events/1.json
  def show
  end

  # GET /hip_chat_events/new
  def new
    @hip_chat_event = HipChatEvent.new
  end

  # GET /hip_chat_events/1/edit
  def edit
  end

  # POST /hip_chat_events
  # POST /hip_chat_events.json
  def create
    @hip_chat_event = HipChatEvent.new(hip_chat_event_params)

    respond_to do |format|
      if @hip_chat_event.save
        format.html { redirect_to @hip_chat_event, notice: 'Hip chat event was successfully created.' }
        format.json { render :show, status: :created, location: @hip_chat_event }
      else
        format.html { render :new }
        format.json { render json: @hip_chat_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hip_chat_events/1
  # PATCH/PUT /hip_chat_events/1.json
  def update
    respond_to do |format|
      if @hip_chat_event.update(hip_chat_event_params)
        format.html { redirect_to @hip_chat_event, notice: 'Hip chat event was successfully updated.' }
        format.json { render :show, status: :ok, location: @hip_chat_event }
      else
        format.html { render :edit }
        format.json { render json: @hip_chat_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hip_chat_events/1
  # DELETE /hip_chat_events/1.json
  def destroy
    @hip_chat_event.destroy
    respond_to do |format|
      format.html { redirect_to hip_chat_events_url, notice: 'Hip chat event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hip_chat_event
      @hip_chat_event = HipChatEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hip_chat_event_params
      params.require(:hip_chat_event).permit(:webhook_type, :date, :mention_name, :message, :room, :webhook_id)
    end
end
