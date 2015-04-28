class ConcertsController < ApplicationController
	def index
      	@concerts = Concert.all
   	end
   	def show
        @concerts = Concert.find(params[:id])
    end
    def new
   		@concert = Concert.new
  	end

  	def edit
  		@concert = Concert.find(params[:id])
	end

  	def create
     	@concert = Concert.new(concert_params)
     	@concert.save
     	redirect_to concert_path(@concert)
  	end

  	def update
 		@concert = Concert.find(params[:id])
 		@concert.update(concert_params)
 		redirect_to  concert_path(@concert)
	end

	def destroy
        @concert = Concert.find(params[:id])
        @concert.destroy
        redirect_to root_path
    end

  	private
    def concert_params
        params.require(:concert).permit(:band, :venue, :city, :date, :price, :description)
    end
end