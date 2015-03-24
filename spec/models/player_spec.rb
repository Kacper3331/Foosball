require "rails_helper"

RSpec.describe Player, type: :model do
  let(:player) { FactoryGirl.create(:player) }

  it { is_expected.to respond_to :firstname }
  it { is_expected.to respond_to :lastname }
  it { is_expected.to respond_to :email }
  it { is_expected.to respond_to :password }

  subject { player }
  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of(:firstname) }
  it { is_expected.to validate_presence_of(:lastname) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_confirmation_of(:password) }

  describe 'when firstname is not present' do
    before { player.firstname = nil }
    it { is_expected.to_not be_valid }
  end

  describe 'when lastname is not present' do
    before { player.lastname = nil }
    it { is_expected.to_not be_valid }
  end

  describe 'when email is not present' do
    before { player.email = nil }
    it { is_expected.to_not be_valid }
  end

  describe 'when password is not present' do
    before { player.password = nil }
    it { is_expected.to_not be_valid }
  end

  describe 'when password is too short' do
    before { player.password = 'short' }
    it { is_expected.to_not be_valid }
  end
end
