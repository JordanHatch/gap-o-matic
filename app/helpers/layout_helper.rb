module LayoutHelper
  def fa_icon_for_flash_message(key)
    case key
    when 'notice' then fa_icon('check')
    when 'alert' then fa_icon('exclamation-triangle')
    end
  end

end
