module ApplicationHelper
  def notice_block
    html = <<-HTML
      <div class="alert alert-success d-flex justify-content-between m-0" role="alert">
      <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
      <div>
        #{notice}
      </div>
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    HTML
    html.html_safe if flash[:notice]
  end

  def alert_block
    html = <<-HTML
      <div class="alert alert-danger d-flex justify-content-between m-0">
      <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
      <div>
        #{alert}
      </div>
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    HTML
    html.html_safe if flash[:alert]
  end
end
