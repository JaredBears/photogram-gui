class MiscController < ApplicationController
  def index
    render(template: "misc_templates/index")
  end
end
