module API
	module V1
		class Consumables < Grape::API
			include API::V1::Defaults      
			resource :consumables do
			desc "Return all users"
			get "" do
				Consumable.all
			end      
			
			desc "Return a user"
			params do
				requires :id, type: String, desc: "ID of the user"
			end
			get ":id" do
				Consumable.where(id: permitted_params[:id]).first!
				ApiWorker.perform_async("funkyfunk")
			end
			
			desc "post to job"
			params do
				requires :tag_id, type: String, desc: "a removal tag ID"
			end
			post ":tag_id" do
				tag_int = params[:tag_id].to_i
				QuickRemoveWorker.perform_async(tag_int, 1)
				end
			end
		end
	end
end