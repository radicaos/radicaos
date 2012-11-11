require 'spec_helper'

describe "downloads/new" do
  before(:each) do
    assign(:download, stub_model(Download).as_new_record)
  end

  it "renders new download form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => downloads_path, :method => "post" do
    end
  end
end
