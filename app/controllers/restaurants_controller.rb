class RestaurantsController < ApplicationController
    # def index
    #   @restaurants = Restaurant.all
    #   render json: @restaurants, status: :ok
    # end
  
    # def show
    #   @restaurant = Restaurant.find_by(id: params[:id])
    #   if @restaurant
    #     render json: @restaurant, include: :pizzas, status: :ok
    #   else
    #     render json: { error: "Restaurant not found" }, status: :not_found
    #   end
    # end
  
    # def create
    #   @restaurant = Restaurant.new(restaurant_params)
    #   if @restaurant.save
    #     render json: @restaurant, status: :created
    #   else
    #     render json: { errors: @restaurant.errors.full_messages }, status: :unprocessable_entity
    #   end
    # end
  
    # def update
    #   @restaurant = Restaurant.find_by(id: params[:id])
    #   if @restaurant
    #     if @restaurant.update(restaurant_params)
    #       render json: @restaurant, status: :ok
    #     else
    #       render json: { errors: @restaurant.errors.full_messages }, status: :unprocessable_entity
    #     end
    #   else
    #     render json: { error: "Restaurant not found" }, status: :not_found
    #   end
    # end
  
    # def destroy
    #   @restaurant = Restaurant.find_by(id: params[:id])
    #   if @restaurant
    #     @restaurant.destroy
    #     head :no_content
    #   else
    #     render json: { error: "Restaurant not found" }, status: :not_found
    #   end
    # end
  
    # private
  
    # def restaurant_params
    #   params.require(:restaurant).permit(:name, :address)
    # end

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
      
       def index
         restaurants = Restaurant.all
         render json: restaurants
       end
     
       def show
         restaurant = Restaurant.find(params[:id])
         render json: restaurant, include: [:pizzas]
       end
      
       def destroy
         restaurant = Restaurant.find_by(id: params[:id])
         restaurant.destroy
         head :no_content
       end
      
       private
     
       def render_not_found_response(exception)
         render json: { error: exception.message }, status: :not_found
       end
      
end
  