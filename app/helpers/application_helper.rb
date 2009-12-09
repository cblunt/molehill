# Methods added to this helper will be available to all templates in the application.
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
end
