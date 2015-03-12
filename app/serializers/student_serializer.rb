class StudentSerializer < ApplicationSerializer
	attributes :name,:email
	has_one :folder
end
