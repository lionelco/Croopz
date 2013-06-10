require 'spec_helper'

describe "occurrences/edit" do
  before(:each) do
    @occurrence = assign(:occurrence, stub_model(Occurrence,
      :number => 1,
      :description => "MyText",
      :defect_id => 1,
      :target_id => 1,
      :company_id => 1,
      :user_id => 1
    ))
  end

  it "renders the edit occurrence form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => occurrences_path(@occurrence), :method => "post" do
      assert_select "input#occurrence_number", :name => "occurrence[number]"
      assert_select "textarea#occurrence_description", :name => "occurrence[description]"
      assert_select "input#occurrence_defect_id", :name => "occurrence[defect_id]"
      assert_select "input#occurrence_target_id", :name => "occurrence[target_id]"
      assert_select "input#occurrence_company_id", :name => "occurrence[company_id]"
      assert_select "input#occurrence_user_id", :name => "occurrence[user_id]"
    end
  end
end
