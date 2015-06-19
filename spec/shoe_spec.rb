require('spec_helper')

describe(Shoe) do

  it('validates presence of name') do
    shoe = Shoe.new(shoe_name: '')
    expect(shoe.save).to(eq(false))
  end

  it('validates name is 50 or fewer characters') do
    shoe = Shoe.new(shoe_name: 'b'*(51))
    expect(shoe.save).to(eq(false))
  end
end
