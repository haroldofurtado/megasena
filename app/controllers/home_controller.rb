class HomeController < ApplicationController
  def index
    validator = Drawer::Validator.new(params)

    render :index, locals: Drawer::Generator.new(validator:).generate
  end
end
