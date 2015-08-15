class MetricsController < ApplicationController

	def index

		metrics = {
			users_count: Plan.not_guest.count
		}

		render json: metrics

	end

end
