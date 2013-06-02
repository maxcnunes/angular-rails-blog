class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
  	render json: Post.all
  end

  # GET /posts/:id
  # GET /posts/:id.json
  def show
  	render json: Post.find(params[:id])
  end
end
