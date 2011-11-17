require 'spec_helper'

describe "minutes/edit.html.erb" do
  before(:each) do
    @minute = assign(:minute, stub_model(Minute,
      :name => "MyString",
      :content => "MyText",
      :user_id => 1
    ))
  end

  it "renders the edit minute form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => minutes_path(@minute), :method => "post" do
      assert_select "input#minute_name", :name => "minute[name]"
      assert_select "textarea#minute_content", :name => "minute[content]"
      assert_select "input#minute_user_id", :name => "minute[user_id]"
    end
  end
end
