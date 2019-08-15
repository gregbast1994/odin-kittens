class KittensController < ApplicationController
    def index
        @kittens = Kitten.paginate(page: params[:page])
    end

    def show
        @kitten = Kitten.find(params[:id])
    end

    def new
        @kitten = Kitten.new
    end

    def create
        @kitten = Kitten.new(kitten_params)
        if @kitten.save
            redirect_to @kitten
            flash[:success] = "Kitten added!"
        else
            render 'new'
        end
    end

    def edit
        @kitten = Kitten.find(params[:id])
    end

    def update
        @kitten = Kitten.find(params[:id])
        if @kitten.update_attributes(kitten_params)
            flash[:success] = 'Kitten edited'
            redirect_to @kitten
        else
            render 'edit'
        end
    end

    def destroy
        @kitten = Kitten.find(params[:id])
        @kitten.delete
        flash[:success] = 'Kitten TERMINATED'
        redirect_to root_url
    end

    private
    def kitten_params
        params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end
