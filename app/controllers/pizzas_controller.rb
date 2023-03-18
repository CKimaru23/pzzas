class PizzasController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  
    def index
      pizzas = Pizza.all
      render json: pizzas
    end
  
    def create
      pizza = Pizza.create!(pizza_params)
      render json: pizza, status: :created
    end
  
    def show
      pizza = Pizza.find(params[:id])
      render json: pizza
    end
  
    def update
      pizza = Pizza.find(params[:id])
      pizza.update!(pizza_params)
      render json: pizza
    end
  
    def destroy
      pizza = Pizza.find(params[:id])
      pizza.destroy
      head :no_content
    end
  
    def create_restaurant_pizza
      restaurant_pizza = RestaurantPizza.create!(restaurant_pizza_params)
      render json: restaurant_pizza.pizza, serializer: PizzaSerializer, status: :created
    end
  
    private
  
    def pizza_params
      params.permit(:name)
    end
  
    def restaurant_pizza_params
      params.require(:restaurant_pizza).permit(:pizza_id, :restaurant_id)
    end
  
    def render_not_found_response(exception)
      render json: { error: exception.message }, status: :not_found
    end
  
    def render_unprocessable_entity_response(exception)
      render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end
end
  