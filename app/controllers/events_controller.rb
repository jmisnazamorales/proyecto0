class EventsController < ApplicationController

  @@list_category = Array['Conferencia', 'Seminario', 'Congreso', 'Curso']
  @@list_brand = Array['Presencial', 'Virtual']

  @@list_category = [
    "Conferencia",
    "Seminario",
    "Congreso",
    "Curso"
  ]

  def index
      @currentUser = current_user.id
      @events = Event.all
  end


  def new
    @categories = @@list_category
    @brands = @@list_brand
    @event = Event.new
  end

  def create
    @currentUser = current_user.id
    @event = Event.new(params.require(:event).permit(:name, :place, :address, :category, :brand, :dateInit , :dateEnd, @currentUser))
    if @event.save
          redirect_to events_path
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
    @categories = @@list_category
    @brands = @@list_brand
  end

  def update
    @event = Event.find(params[:id])
      if @event.update(evevnt_params)
        redirect_to events_path
      else
        render :edit
      end
  end

  def delete
     @event = Event.find(params[:id])
     @event.destroy
     redirect_to events_path
   end

  def evevnt_params
     params.require(:event).permit(:name, :place, :address, :category, :brand, :dateInit , :dateEnd)
  end


  end
