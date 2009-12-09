# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def render_ajax_flash page
    if flash[:success]
      page[:flash_success].text(flash[:success]).fadeIn
    end

    if flash[:notice]
      page[:flash_notice].text(flash[:notice]).fadeIn
    end

    if flash[:success]
      page[:flash_success].text(flash[:success]).fadeIn
    end

    flash.discard
  end
end
