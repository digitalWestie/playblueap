module ApplicationHelper

  def action_text action
    reply_txt = action.body[0..10].downcase.eql?("@playblueap") 
    reply_txt ? action.body[11..-1] : action.body 
  end

end
