require 'spec_helper'

describe "downloads/index" do
  before(:each) do
    assign(:downloads, [
      stub_model(Download),
      stub_model(Download)
    ])
  end

  it "renders a list of downloads" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
