require 'spec_helper'

describe "rspecs/edit.html.erb" do
  before(:each) do
    @rspec = assign(:rspec, stub_model(Rspec,
      :new_record? => false
    ))
  end

  it "renders the edit rspec form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => rspec_path(@rspec), :method => "post" do
    end
  end
end
