require 'spec_helper'

describe "rspecs/show.html.erb" do
  before(:each) do
    @rspec = assign(:rspec, stub_model(Rspec))
  end

  it "renders attributes in <p>" do
    render
  end
end
