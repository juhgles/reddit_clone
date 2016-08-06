module ApplicationHelper

  def auth_token
  "<input type=\"hidden\" name=\"authenticity_token\" value=\"#{form_authenticity_token}\" >".html_safe
  end


  def nested(comment)
    html = content_tag(:ul) {
    ul_contents = ""
    ul_contents << content_tag(:li, "#{comment.content}")
    ul_contents << content_tag(:li, "<%= link_to 'reply', comment_url(comment) %>".html_safe)
    comment.child_comments.each do |child|
      ul_contents << nested(child)
    end

      ul_contents.html_safe
    }.html_safe
  end
end
