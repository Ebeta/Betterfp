
namespace :medication do

	task create: :environment do
		Nokogiri::HTML(RestClient.post "http://www.medilexicon.com/drugsearch.php?z=true", {params: {"foo" => "bar"}}).css('#wrapper #level0 #main ul li').each do |medication|
			Medication.create(name: medication.text)
		end
	end

end


# rake medication:create
# heroku run rake medication:create