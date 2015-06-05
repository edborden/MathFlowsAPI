class InvalidationSerializer < ApplicationSerializer
	attributes :message_type
	has_one :block
end