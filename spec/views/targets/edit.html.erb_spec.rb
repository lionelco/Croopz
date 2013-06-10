require 'spec_helper'

describe "targets/edit" do
  before(:each) do
    @target = assign(:target, stub_model(Target,
      :name => "MyString",
      :description => "MyText",
      :user_id => 1,
      :company_id => "MyString"
    ))
  end

  it "renders the edit target form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => targets_path(@target), :method => "post" do
      assert_select "input#target_name", :name => "target[name]"
      assert_select "textarea#target_description", :name => "target[description]"
      assert_select "input#target_user_id", :name => "target[user_id]"
      assert_select "input#target_company_id", :name => "target[company_id]"
    end
  end
end
