class MetricsController < ApplicationController

	def index

		metrics = {
			users_count: User.not_guest.count
		}

		render json: metrics

	end

end
