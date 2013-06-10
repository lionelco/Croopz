require 'spec_helper'

describe "occurrences/show" do
  before(:each) do
    @occurrence = assign(:occurrence, stub_model(Occurrence,
      :number => 1,
      :description => "MyText",
      :defect_id => 2,
      :target_id => 3,
      :company_id => 4,
      :user_id => 5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/MyText/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/5/)
  end
end
