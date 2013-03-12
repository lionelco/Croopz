require 'spec_helper'

describe "defect_occurrences/index" do
  before(:each) do
    assign(:defect_occurrences, [
      stub_model(DefectOccurrence,
        :number => 1,
        :description => "MyText",
        :defect_id => 2,
        :target_id => 3,
        :company_id => 4,
        :user_id => 5
      ),
      stub_model(DefectOccurrence,
        :number => 1,
        :description => "MyText",
        :defect_id => 2,
        :target_id => 3,
        :company_id => 4,
        :user_id => 5
      )
    ])
  end

  it "renders a list of defect_occurrences" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
  end
end
