class Shoe < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:shoe_name, {:presence => true, :length => {:minimum => 2, :maximum => 50}})
  before_save(:capitalize_name)

  scope(:not_done, -> do
    where({done=> false})
  end)

private


  define_method(:capitalize_name) do
    self.shoe_name=shoe_name().capitalize()
  end
end
