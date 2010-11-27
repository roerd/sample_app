require 'spec_helper'

describe "rspecs/index.html.erb" do
  before(:each) do
    assign(:rspecs, [
      stub_model(Rspec),
      stub_model(Rspec)
    ])
  end

  it "renders a list of rspecs" do
    render
  end
end
