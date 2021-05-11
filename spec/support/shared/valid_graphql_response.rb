# Shared example for common expectations on a successful graphql mutation/query.
# Needs to define the subject as the result of the MyUnsplashApiSchema.execute() call
RSpec.shared_examples 'valid graphql response' do
  it 'should return no errors' do
    expect(subject).not_to have_key('errors')
  end

  it 'should return some data payload' do
    expect(subject).to have_key('data')
  end
end
