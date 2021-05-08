RSpec.shared_examples 'paginated response' do
  it 'should return at most the limit of items' do
    expect(payload.length).to be <= limit
  end

  it 'should return items starting by the offset-th element' do
    payload_ids = payload.pluck('id').map(&:to_i)
    list_ids = list.pluck(:id)

    expect(payload_ids[0]).to eq(list_ids[offset])
  end
end
