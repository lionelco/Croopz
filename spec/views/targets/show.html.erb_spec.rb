require 'spec_helper'

describe "targets/show" do
  before(:each) do
    @target = assign(:target, stub_model(Target,
      :name => "Name",
      :description => "MyText",
      :user_id => 1,
      :company_id => "Company"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
    rendered.should match(/Company/)
  end
end
