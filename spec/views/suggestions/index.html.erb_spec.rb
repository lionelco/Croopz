require 'spec_helper'

describe "suggestions/index" do
  before(:each) do
    assign(:suggestions, [
      stub_model(Suggestion,
        :number => 1,
        :description => "MyText",
        :defect_id => 2,
        :target_id => 3,
        :company_id => 4
      ),
      stub_model(Suggestion,
        :number => 1,
        :description => "MyText",
        :defect_id => 2,
        :target_id => 3,
        :company_id => 4
      )
    ])
  end

  it "renders a list of suggestions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
