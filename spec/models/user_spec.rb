require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:username) }

    it { should validate_exclusion_of(:username).in_array([ "qwerty", "abcdef" ]) }

    end
end
