# Does nothing important
module OrdersModule
  def model_array(models_array, model)
    model.each do |model_instance|
      models_array.push(model_instance.name)
    end
    models_array
  end

  def instance_factors
    @brands_array = model_array(@brands_array = [], Brand.order(:name))
    @products_array = model_array(@products_array = [], Product.order(:name))
    @categories_array = model_array(@categories_array = [], Category.order(:name))
  end
end