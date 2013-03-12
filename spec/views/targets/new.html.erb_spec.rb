require 'spec_helper'

describe "targets/new" do
  before(:each) do
    assign(:target, stub_model(Target,
      :name => "MyString",
      :description => "MyText",
      :user_id => 1,
      :company_id => "MyString"
    ).as_new_record)
  end

  it "renders new target form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => targets_path, :method => "post" do
      assert_select "input#target_name", :name => "target[name]"
      assert_select "textarea#target_description", :name => "target[description]"
      assert_select "input#target_user_id", :name => "target[user_id]"
      assert_select "input#target_company_id", :name => "target[company_id]"
    end
  end
end
