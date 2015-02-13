class Mailer < MandrillMailer::TemplateMailer
	default from: "support@mathflows.com"
	default from_name: "MathFlows"

	def welcome user
		mandrill_mail( template: 'welcome',
			subject: "Welcome to MathFlows",
			to: {email: user.email, name: user.name},
			important: true,
			inline_css: true,
			async: true
		).deliver
	end

	def invitation email,referrer
		mandrill_mail( template: 'invitation',
			subject: "#{referrer.name} invited you to MathFlows",
			to: email,
			important: true,
			inline_css: true,
			vars: {'REFERRER_NAME' => referrer.name, 'REFERRER_ID' => referrer.id},
			async: true
		).deliver
	end

end