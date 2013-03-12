require 'spec_helper'

describe "defects/show" do
  before(:each) do
    @defect = assign(:defect, stub_model(Defect,
      :name => "Name",
      :description => "MyText",
      :impact => 1,
      :target_id => 2,
      :occurence => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
