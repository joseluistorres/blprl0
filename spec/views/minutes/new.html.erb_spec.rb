require 'spec_helper'

describe "minutes/new.html.erb" do
  before(:each) do
    assign(:minute, stub_model(Minute,
      :name => "MyString",
      :content => "MyText",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new minute form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => minutes_path, :method => "post" do
      assert_select "input#minute_name", :name => "minute[name]"
      assert_select "textarea#minute_content", :name => "minute[content]"
      assert_select "input#minute_user_id", :name => "minute[user_id]"
    end
  end
end
