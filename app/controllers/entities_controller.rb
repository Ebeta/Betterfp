class EntitiesController < ActionController::Base
	def display
		@entity = Entity.new
	end
	def create
		@entity = Entity.create(entities_params)
		redirect_to entities_path
	end
private

	def entities_params
    	params.require(:entity).permit(:location, :name, :title)
	end
end
