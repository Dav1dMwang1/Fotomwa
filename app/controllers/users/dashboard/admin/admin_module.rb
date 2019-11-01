# Does nothing important
module AdminModule
  def model_array(models_array, model)
    model.each do |model_instance|
      models_array.push([model_instance.name, model_instance.id])
    end
    models_array
  end

  def instance_factors
    @brands_array = model_array(@brands_array = [], Brand.all)
    @products_array = model_array(@brands_array = [], Brand.all)
    @categories_array = model_array(@categories_array = [], Category.all)
  end
end