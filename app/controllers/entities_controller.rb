class EntitiesController < ActionController
	before_action :is_admin?, only: :create
	
	def display
		@entity = Entity.new

	end
	def create

		redirect_to entities_path
	end

private

	def entities_params
    	params.require(:entity).permit(:location, :name, :title)
	end
end
