class KeenHandler
	include Handler

	def publish event,object
		Keen.publish event, object.as_json
	end

end