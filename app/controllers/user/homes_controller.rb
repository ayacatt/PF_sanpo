class User::HomesController < ApplicationController
  def top
    spots = Spot.all
    gon.all_spots = spots
    posts = []
    spots.each do |spot|
      posts.push(spot.post)
    end
    gon.selected_posts = posts
    @posts = Post.order(created_at: :desc).limit(3)
  end

  def about; end
end
