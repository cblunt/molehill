module ApplicationHelper
  def render_ajax_flash page
    if flash[:success]
      page[:flash_success].text(flash[:success]).blindDown.idle(5000).blindUp
    end

    if flash[:notice]
      page[:flash_notice].text(flash[:notice]).blindDown.idle(5000).blindUp
    end

    if flash[:error]
      page[:flash_error].text(flash[:error]).blindDown.idle(5000).blindUp
    end

    flash.discard
  end

  # Output a gravatar image tag for the given +email+.
  # Based on http://overhrd.com/?p=28
  def gravatar_url_for(email, options = {})
    options[:size] ||= 48
    options[:ssl] ||= false

    if options[:ssl]
      options[:host] = "secure.gravatar.com"
      options[:protocol] = "https"
    else
      options[:host] = "gravatar.com"
      options[:protocol] = "http"
    end

    url = options[:protocol]
    url << "://"
    url << options[:host]
    url << "/avatar.php"
    url << "?gravatar_id=#{Digest::MD5.hexdigest(email)}"
    url << "&format=jpg"
    url << "&default=#{url_for("/images/user_#{options[:size]}.png")}"
    
    url
  end

  def gravatar_image_tag(email, options = {}, html_options = {})
    html_options[:class] ||= "gravatar"

    image_tag gravatar_url_for(email, options), html_options
  end

  def google_analytics_tags
    APP_CONFIG['google_analytics_code'] unless APP_CONFIG['google_analytics_code'].nil?
  end
end
