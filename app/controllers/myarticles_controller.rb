class MyarticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    #article_params
    
    def show
        #set_article
    end

    def index
        # @myarticles = Myarticle.all
        @myarticles = Myarticle.paginate(page: params[:page], per_page: 3)
    end

    def new
        @myarticle = Myarticle.new()
        # not necessary to declare here
        # if we do passing error directly
        # without call .error in html.erb
        # it works!!!
        # @article.save
    end

    def edit
        #set_article
    end

    def update
        #byebug
        #set_article
        if @myarticle.update(myarticle_params)
          flash[:notice] = "Article was updated successfully."
          redirect_to @myarticle
        else
          render 'edit'
        end
    end

    def destroy
        #set_article
        @myarticle.destroy
        redirect_to myarticles_path
    end

    def create
        #@article = Myarticle.new()
        #@article.save

        #render plain: params[:myarticle] #this print the parms.myarticle directly to html 
        #render plain: params.require(:myarticle).permit(:title, :description)

        # t = params[:myarticle][:title]
        # d = params[:myarticle][:description]       
        # article = Myarticle.new(title:t, description:d)

        @myarticle = Myarticle.new(myarticle_params)
        # @myarticle.myuser = Myuser.first
        @myarticle.myuser = current_user
        if @myarticle.save
            flash[:notice] = "Article was created successfully."
            redirect_to @myarticle
        else
            @error = @myarticle.errors.full_messages
            render 'new'
                           
        end

        # --I just pass @error to html.erb where it doesn't have to call.errors,-- 
        # --so, no variable declare need at NEW--
        # 
        # article = Myarticle.new(params.require(:myarticle).permit(:title, :description))
        # if article.save
        #     redirect_to @article
        # else
        #     @error = article.errors.full_messages
        #     render 'new'
        # end

        #redirect_to myarticle_path (article)
        # render plain: article.inspect
        # render plain: Myarticle.all #params[:myarticle] #this print the parms.myarticle directly to html 
    end


    private #anything below is not public and only be called here
    
    #move action under private, the action will not be available to public 
    #e.g. 
    # def destroy
    #     ...
    # end    

    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @myarticle = Myarticle.find(params[:id])

    end

    # Only allow a list of trusted parameters through.
    def myarticle_params
        # params.require(:myarticle).permit(:title, :description)
        params.require(:myarticle).permit(:title, :description, category_ids: [])

    end

    def require_same_user
        # if current_user != @myrticle.user
        if current_user != @myarticle.myuser && !current_user.admin?
          flash[:alert] = "You can only edit or delete your own article"
          redirect_to @myarticle
        end
      end
end
  