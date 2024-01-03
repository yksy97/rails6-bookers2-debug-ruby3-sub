class EventMailer < ApplicationMailer
  def send_notification(member, event)
    @group = event[:group]
    @title = event[:title]
    @body = event[:body]
    
      @mail = EventMailer.new()
    
    mail(
      from: 'Gmailアドレス',
      to:   member.email,
      subject: '新規お知らせ'
    )
  end
   def self.send_notifications_to_group(event)
    group = event[:group]
    group.users.each do |member|
      
      EventMailer.send_notification(member, event).deliver_now
    end
   end
end
