module ApplicationHelper
  def gravatar_for(user, options = { size: 80})
      email_address = user.email.downcase
      # email_address = "fishfish1402@gmail.com"        
      hash = Digest::MD5.hexdigest(email_address)
      size = options[:size]
      gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
      image_tag(gravatar_url, alt: user.username, class: "rounded shadow mx-auto d-block")
  end

  # helper_method :current_user, :logged_in?

  # def current_user
  #   @current_user ||= Myuser.find(session[:user_id]) if session[:user_id]
  # end

  # def logged_in?
  #   !!current_user
  # end


end