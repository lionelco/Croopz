require 'spec_helper'

describe "targets/index" do
  before(:each) do
    assign(:targets, [
      stub_model(Target,
        :name => "Name",
        :description => "MyText",
        :user_id => 1,
        :company_id => "Company"
      ),
      stub_model(Target,
        :name => "Name",
        :description => "MyText",
        :user_id => 1,
        :company_id => "Company"
      )
    ])
  end

  it "renders a list of targets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Company".to_s, :count => 2
  end
end
