class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]
  def landing_page
    @posts = Post.all.limit(3)
    @latest_posts = Post.all.limit(3).order(created_at: :desc)
  end

  def privacy_policy
  end
end
