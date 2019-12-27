require 'rails_helper'

RSpec.describe "ScoreManagements", type: :request do
  describe "GET /score_managements" do
    it "works! (now write some real specs)" do
      get score_managements_path
      expect(response).to have_http_status(200)
    end
  end
end
