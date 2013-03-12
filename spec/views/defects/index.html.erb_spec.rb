require 'spec_helper'

describe "defects/index" do
  before(:each) do
    assign(:defects, [
      stub_model(Defect,
        :name => "Name",
        :description => "MyText",
        :impact => 1,
        :target_id => 2,
        :occurence => 3
      ),
      stub_model(Defect,
        :name => "Name",
        :description => "MyText",
        :impact => 1,
        :target_id => 2,
        :occurence => 3
      )
    ])
  end

  it "renders a list of defects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
