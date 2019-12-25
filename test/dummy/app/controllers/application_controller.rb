class ApplicationController < ActionController::Base
  private

  def something
    raise if params[:raise_error]
  end
end
