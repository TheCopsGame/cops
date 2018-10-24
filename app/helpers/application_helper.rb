module ApplicationHelper
  def flash_message_class(type)
    case type
    when 'notice'
      'positive'
    when 'alert'
      'negative'
    else
      ''
    end
  end
end
