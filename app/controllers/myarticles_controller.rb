class MyarticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    #article_params
    
    def show
        #set_article
    end

    def index
        @articles = Myarticle.all
    end

    def new
        @article = Myarticle.new()
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
        if @article.update(article_params)
          flash[:notice] = "Article was updated successfully."
          redirect_to @article
        else
          render 'edit'
        end
    end

    def destroy
        #set_article
        @article.destroy
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

        @article = Myarticle.new(article_params)
        if @article.save
            flash[:notice] = "Article was created successfully."
            redirect_to @article
        else
            @error = @article.errors.full_messages
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
      @article = Myarticle.find(params[:id])

    end

    # Only allow a list of trusted parameters through.
    def article_params
        params.require(:myarticle).permit(:title, :description)
    end
end
  