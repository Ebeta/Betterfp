class MedicationsController < InheritedResources::Base

    def index
        @medications = Medications.all
    end

    def new
        @medication = current_user.medication.new
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

     def delete
    @profile.destroy

    end

    private

    def medication_params
      params.require(:medication).permit(:user_id, :name, :description)
    end
end
