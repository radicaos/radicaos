require 'spec_helper'

describe "downloads/show" do
  before(:each) do
    @download = assign(:download, stub_model(Download))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
