module ActiveModel
  class Errors
    def full_messages_for(attribute)
      (get(attribute) || []).map { |message| full_message(attribute, message) }
    end
  end
end