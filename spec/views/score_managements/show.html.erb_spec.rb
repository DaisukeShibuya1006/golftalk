require 'rails_helper'

RSpec.describe "score_managements/show", type: :view do
  before(:each) do
    @score_management = assign(:score_management, ScoreManagement.create!(
      :when => "When",
      :course => "Course",
      :stroke => "",
      :patting => "",
      :thought => "MyText",
      :uid => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/When/)
    expect(rendered).to match(/Course/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
