class MedicationsController < InheritedResources::Base

    def index
    @medications = Medication.all

    end

    def new
        @medication = Medication.new
    end

    def show

    end

    def update
     @medication = Medication.find(params[:id])
        @medication.update(medication_params)
        @medication.save
        redirect_to :back
    end

    def edit
    end

    def create
    end


    private

    def medication_params
      params.require(:medication).permit(:user_id, :name, :description)
    end
end
