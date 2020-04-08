def sort(*input)
  input.sort
end

describe 'AlphanumericSort' do
  it 'returns array' do
    expect(sort).to eq([])
    expect(sort("a","b")).to eq(["a","b"])
    expect(sort("b","a")).to eq(["a","b"])
    expect(sort("a 11", "a 2")).to eq(["a 2","a 11"])
  end
end
