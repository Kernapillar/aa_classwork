Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only:[:index, :new, :create] do 
    resources :subs, only:[:edit, :update, :destroy]
    resources :posts, only:[:edit, :update, :destroy]
  end
  resources :subs, except:[:edit, :update,:destroy,]

  resources :posts, only:[:new, :create, :show, :index]
  
  resource :session, only: [:new, :create, :destroy]


  # nested routes notes from Paulo:

  # /users/:user_id/posts
  # /posts
  
  # def index
  #   if params[:user_id]
  #     @posts = Post.where(author_id: params[:user_id])
  #   elsif params[:query]
  #     @posts = Post.where('name LIKE ?', params[:query])
  #   else
  #     @posts = Post.all
  #   end
  #   render :index
  # end

end
