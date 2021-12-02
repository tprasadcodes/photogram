require 'rails_helper'

RSpec.describe FriendRequestResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'friend_requests',
          attributes: attributes_for(:friend_request)
        }
      }
    end

    let(:instance) do
      FriendRequestResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { FriendRequest.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:friend_request) { create(:friend_request) }

    let(:payload) do
      {
        data: {
          id: friend_request.id.to_s,
          type: 'friend_requests',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      FriendRequestResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { friend_request.reload.updated_at }
      # .and change { friend_request.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:friend_request) { create(:friend_request) }

    let(:instance) do
      FriendRequestResource.find(id: friend_request.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { FriendRequest.count }.by(-1)
    end
  end
end
