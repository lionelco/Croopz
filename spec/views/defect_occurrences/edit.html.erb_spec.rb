require 'spec_helper'

describe "defect_occurrences/edit" do
  before(:each) do
    @defect_occurrence = assign(:defect_occurrence, stub_model(DefectOccurrence,
      :number => 1,
      :description => "MyText",
      :defect_id => 1,
      :target_id => 1,
      :company_id => 1,
      :user_id => 1
    ))
  end

  it "renders the edit defect_occurrence form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => defect_occurrences_path(@defect_occurrence), :method => "post" do
      assert_select "input#defect_occurrence_number", :name => "defect_occurrence[number]"
      assert_select "textarea#defect_occurrence_description", :name => "defect_occurrence[description]"
      assert_select "input#defect_occurrence_defect_id", :name => "defect_occurrence[defect_id]"
      assert_select "input#defect_occurrence_target_id", :name => "defect_occurrence[target_id]"
      assert_select "input#defect_occurrence_company_id", :name => "defect_occurrence[company_id]"
      assert_select "input#defect_occurrence_user_id", :name => "defect_occurrence[user_id]"
    end
  end
end
