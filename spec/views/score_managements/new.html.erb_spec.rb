require 'rails_helper'

RSpec.describe "score_managements/new", type: :view do
  before(:each) do
    assign(:score_management, ScoreManagement.new(
      :when => "MyString",
      :course => "MyString",
      :stroke => "",
      :patting => "",
      :thought => "MyText",
      :uid => ""
    ))
  end

  it "renders new score_management form" do
    render

    assert_select "form[action=?][method=?]", score_managements_path, "post" do

      assert_select "input[name=?]", "score_management[when]"

      assert_select "input[name=?]", "score_management[course]"

      assert_select "input[name=?]", "score_management[stroke]"

      assert_select "input[name=?]", "score_management[patting]"

      assert_select "textarea[name=?]", "score_management[thought]"

      assert_select "input[name=?]", "score_management[uid]"
    end
  end
end
