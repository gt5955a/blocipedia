module WikisHelper
  def user_is_authorized_for_wikis?
    current_user
  end

  def user_is_authorized_to_create?
    current_user && (current_user.premium? || current_user.admin?)
  end

  def user_is_authorized_to_update?
    current_user
  end

  def user_is_authorized_to_delete?
    current_user && (current_user == @wiki.user || current_user.admin?)
  end

  def markdown(text)
    extensions = [:tables, :fenced_code_blocks, :autolink, :strikethrough, :underline, :highlight, :quote, :footnotes]
    Markdown.new(text, extensions).to_html.html_safe
  end
end
