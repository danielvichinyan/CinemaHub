class EventsController < ApplicationController
  def index
    @events = Event.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end
end
