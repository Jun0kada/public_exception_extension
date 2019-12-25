class Admin::PostsController < ApplicationController
  def index
    something

    render plain: 'admin/posts#index'
  end

  def show
    something

    render plain: 'admin/posts#show'
  end
end
