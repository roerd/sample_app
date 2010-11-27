require 'spec_helper'

describe "rspecs/new.html.erb" do
  before(:each) do
    assign(:rspec, stub_model(Rspec).as_new_record)
  end

  it "renders new rspec form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => rspecs_path, :method => "post" do
    end
  end
end
