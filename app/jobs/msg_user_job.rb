class MsgUserJob < ApplicationJob
  queue_as :default

  def perform(user, session_with_expand)
    # Do something later
    @session_with_expand = session_with_expand 

    @session_with_expand.line_items.data.each do |line_item|
      TwilioClient.new.send_text(user, "You have booked #{line_item.quantity} of seats for #{line_item.description} movie!")
    end
  end
end
