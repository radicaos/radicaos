require 'spec_helper'

describe "downloads/edit" do
  before(:each) do
    @download = assign(:download, stub_model(Download))
  end

  it "renders the edit download form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => downloads_path(@download), :method => "post" do
    end
  end
end
