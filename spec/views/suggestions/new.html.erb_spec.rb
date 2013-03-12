require 'spec_helper'

describe "suggestions/new" do
  before(:each) do
    assign(:suggestion, stub_model(Suggestion,
      :number => 1,
      :description => "MyText",
      :defect_id => 1,
      :target_id => 1,
      :company_id => 1
    ).as_new_record)
  end

  it "renders new suggestion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => suggestions_path, :method => "post" do
      assert_select "input#suggestion_number", :name => "suggestion[number]"
      assert_select "textarea#suggestion_description", :name => "suggestion[description]"
      assert_select "input#suggestion_defect_id", :name => "suggestion[defect_id]"
      assert_select "input#suggestion_target_id", :name => "suggestion[target_id]"
      assert_select "input#suggestion_company_id", :name => "suggestion[company_id]"
    end
  end
end
