class PostsController < ApplicationController
  def index
    something

    render plain: 'posts#index'
  end

  def show
    something

    render plain: 'posts#show'
  end
end
