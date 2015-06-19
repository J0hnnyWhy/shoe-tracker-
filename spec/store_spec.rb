require('spec_helper')

describe(Store) do
    it('has many shoes') do
      store = Store.create(name: 'The Blob')
      shoe1 = Shoe.create(shoe_name: 'dirt field', store_ids: [store.id])
      shoe2 = Shoe.create(shoe_name: 'rooftop', store_ids: [store.id])
      expect(store.shoes).to(eq([shoe1, shoe2]))
    end

    it("converts the name to capitolize") do
      store = Store.create({:name => "shoe store"})
      expect(store.name()).to(eq("Shoe Store"))
    end


  it('validates presence of name') do
    ingredient = Store.new(name: '')
    expect(ingredient.save).to(eq(false))
  end

  it('validates name is 50 or fewer characters') do
    store = Store.new(name: 'b'*(51))
    expect(store.save).to(eq(false))
  end
end
