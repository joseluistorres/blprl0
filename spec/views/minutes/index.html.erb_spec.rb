require 'spec_helper'

describe "minutes/index.html.erb" do
  before(:each) do
    assign(:minutes, [
      stub_model(Minute,
        :name => "Name",
        :content => "MyText",
        :user_id => 1
      ),
      stub_model(Minute,
        :name => "Name",
        :content => "MyText",
        :user_id => 1
      )
    ])
  end

  it "renders a list of minutes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
