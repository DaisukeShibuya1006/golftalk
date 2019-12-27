require 'rails_helper'

RSpec.describe "score_managements/index", type: :view do
  before(:each) do
    assign(:score_managements, [
      ScoreManagement.create!(
        :when => "When",
        :course => "Course",
        :stroke => "",
        :patting => "",
        :thought => "MyText",
        :uid => ""
      ),
      ScoreManagement.create!(
        :when => "When",
        :course => "Course",
        :stroke => "",
        :patting => "",
        :thought => "MyText",
        :uid => ""
      )
    ])
  end

  it "renders a list of score_managements" do
    render
    assert_select "tr>td", :text => "When".to_s, :count => 2
    assert_select "tr>td", :text => "Course".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
