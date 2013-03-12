require 'spec_helper'

describe "defects/new" do
  before(:each) do
    assign(:defect, stub_model(Defect,
      :name => "MyString",
      :description => "MyText",
      :impact => 1,
      :target_id => 1,
      :occurence => 1
    ).as_new_record)
  end

  it "renders new defect form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => defects_path, :method => "post" do
      assert_select "input#defect_name", :name => "defect[name]"
      assert_select "textarea#defect_description", :name => "defect[description]"
      assert_select "input#defect_impact", :name => "defect[impact]"
      assert_select "input#defect_target_id", :name => "defect[target_id]"
      assert_select "input#defect_occurence", :name => "defect[occurence]"
    end
  end
end
