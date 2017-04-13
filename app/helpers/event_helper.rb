module EventHelper

  def current_event
    Event.find_by(id: params[:id])
  end

end
