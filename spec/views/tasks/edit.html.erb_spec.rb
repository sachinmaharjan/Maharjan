require 'spec_helper'

describe "tasks/edit" do
  before(:each) do
    @task = assign(:task, stub_model(Task,
      :user_id => 1,
      :headline => "MyString"
    ))
  end

  it "renders the edit task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", task_path(@task), "post" do
      assert_select "input#task_user_id[name=?]", "task[user_id]"
      assert_select "input#task_headline[name=?]", "task[headline]"
    end
  end
end
