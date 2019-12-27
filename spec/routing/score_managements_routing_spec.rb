require "rails_helper"

RSpec.describe ScoreManagementsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/score_managements").to route_to("score_managements#index")
    end

    it "routes to #new" do
      expect(:get => "/score_managements/new").to route_to("score_managements#new")
    end

    it "routes to #show" do
      expect(:get => "/score_managements/1").to route_to("score_managements#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/score_managements/1/edit").to route_to("score_managements#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/score_managements").to route_to("score_managements#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/score_managements/1").to route_to("score_managements#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/score_managements/1").to route_to("score_managements#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/score_managements/1").to route_to("score_managements#destroy", :id => "1")
    end
  end
end
