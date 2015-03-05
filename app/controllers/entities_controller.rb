class EntitiesController < ApplicationController
	before_action :is_admin?, only: :create
	before_action :has_entity?, only: :new
	def display
		@entity = Entity.new
	end
	
	def create
		@entity = Entity.create(entities_params)
		redirect_to entities_path
	end

	def new
		@entity = Entity.new
	end

private

	def entities_params
    	params.require(:entity).permit(:location, :name, :title)
	end
end
