require "rails_helper"

RSpec.describe "votes#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/votes", payload
  end

  describe "basic create" do
    let(:params) do
      attributes_for(:vote)
    end
    let(:payload) do
      {
        data: {
          type: "votes",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(VoteResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { Vote.count }.by(1)
    end
  end
end
