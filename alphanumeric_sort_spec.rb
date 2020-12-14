require_relative 'alphanumeric_sort'

describe 'AlphanumericSort' do
  it 'sorts arguments alphanumerically' do
    expect(sort).to eq([])
    expect(sort('a', 'b')).to eq(['a', 'b'])
    expect(sort('b', 'a')).to eq(['a', 'b'])
    expect(sort('a 11', 'a 2')).to eq(['a 2', 'a 11'])
    expect(sort('a11', 'a2')).to eq(['a2', 'a11'])
    expect(sort('a000011', 'a02')).to eq(['a02', 'a000011'])
    expect(sort('line-2', 'line-1')).to eq(['line-1', 'line-2'])
    expect(sort('line 1', 'line 0 a1')).to eq(['line 0 a1', 'line 1'])
    expect(sort('line 1', 'line 1 a')).to eq(['line 1', 'line 1 a'])
    expect(sort('line 1', 'line a')).to eq(['line a', 'line 1'])
  end
end
