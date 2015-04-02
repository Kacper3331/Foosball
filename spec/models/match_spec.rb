require 'rails_helper'

RSpec.describe Match, type: :model do
  it { is_expected.to respond_to :date }
  it { is_expected.to respond_to :first_player_score }
  it { is_expected.to respond_to :second_player_score }
  it { is_expected.to respond_to :players }

  it { is_expected.to validate_presence_of(:date) }
  it { is_expected.to validate_presence_of(:first_player_score) }
  it { is_expected.to validate_presence_of(:second_player_score) }
  it { is_expected.to validate_presence_of(:players) }
end
