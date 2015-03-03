class MedicationsController < InheritedResources::Base

    def index
    end

    def new
    end

    def update
    end

    def edit
    end

    def create
    end

     def delete
    @profile.destroy

    end

    private

    def medication_params
      params.require(:medication).permit(:user_id, :name, :description, :specialNotes)
    end
end
