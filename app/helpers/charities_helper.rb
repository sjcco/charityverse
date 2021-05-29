module CharitiesHelper
  def display_icon_title(group)
    h = if group.nil?
          <<-HTML
        #{image_tag 'no_group.jpg', class: 'img-fluid my-4'}
        <h3 class='text-center text-dark fs-2'>No group</h3>
          HTML
        else
          <<-HTML
        #{image_tag group.icon, class: 'img-fluid my-4'}
        <h3 class='text-center text-dark fs-2'>#{group.name}</h3>
          HTML
        end
    h.html_safe
  end

  def display_icon(charity)
    if charity.group_id.nil?
      image_tag 'no_group.jpg', class: 'img-fluid'
    else
      image_tag Group.find(charity.group_id).icon, class: 'img-fluid'
    end
  end
end
