class ProductSerializer
  include JSONAPI::Serializer
  attributes :name, :price, :category, :description

end
