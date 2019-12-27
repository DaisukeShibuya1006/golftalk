require 'rails_helper'

RSpec.describe "score_managements/edit", type: :view do
  before(:each) do
    @score_management = assign(:score_management, ScoreManagement.create!(
      :when => "MyString",
      :course => "MyString",
      :stroke => "",
      :patting => "",
      :thought => "MyText",
      :uid => ""
    ))
  end

  it "renders the edit score_management form" do
    render

    assert_select "form[action=?][method=?]", score_management_path(@score_management), "post" do

      assert_select "input[name=?]", "score_management[when]"

      assert_select "input[name=?]", "score_management[course]"

      assert_select "input[name=?]", "score_management[stroke]"

      assert_select "input[name=?]", "score_management[patting]"

      assert_select "textarea[name=?]", "score_management[thought]"

      assert_select "input[name=?]", "score_management[uid]"
    end
  end
end
