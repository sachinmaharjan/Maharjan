require 'spec_helper'

describe "tasks/index" do
  before(:each) do
    assign(:tasks, [
      stub_model(Task,
        :user_id => 1,
        :headline => "Headline"
      ),
      stub_model(Task,
        :user_id => 1,
        :headline => "Headline"
      )
    ])
  end

  it "renders a list of tasks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Headline".to_s, :count => 2
  end
end
