require 'mailchimp'

class MailchimpHandler
  include Handler

  def client
    @client ||= Mailchimp::API.new ENV['MAILCHIMP_KEY']
  end

  def subscribe user
    begin
      client.lists.subscribe "22facc0315", {email:user.email}, {name:user.name}, 'html', false
    rescue
      puts "Mailchimp sucks"
    end
  end

end