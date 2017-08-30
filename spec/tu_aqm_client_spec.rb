require "spec_helper"

RSpec.describe TuAqmClient do
  it "has a version number" do
    expect(TuAqmClient::VERSION).not_to be nil
  end
end
