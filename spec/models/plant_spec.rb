require 'rails_helper'

RSpec.describe Plant, type: :model do
  let(:plant) do
    Plant.create(
      name: 'Daisy',
      watered_at: watered_time,
      fed_at: fed_time,
      water_amount: water,
      fed_amount: food
    )
  end

  before(:each) do
    plant.destroy
  end

  describe '#needs_water?' do
    subject { plant.needs_water? }

    let(:water) { nil }
    let(:food) { nil }

    context 'when watered over 5 minutes ago' do
      let(:fed_time) { 10.minutes.ago }
      let(:watered_time) { 10.minutes.ago }

      it { is_expected.to eq true }
    end

    context 'when watered within 5 minutes' do
      let(:fed_time) { 10.minutes.ago }
      let(:watered_time) { Time.now }
      it { is_expected.to eq false }
    end
  end

  describe '#needs_food?' do
    subject { plant.needs_food? }

    let(:water) { nil }
    let(:food) { nil }

    context 'when fed over 10 minutes ago' do
      let(:fed_time) { 10.minutes.ago }
      let(:watered_time) { 10.minutes.ago }
      it { is_expected.to eq true }
    end

    context 'when fed within 10 minutes' do
      let(:fed_time) { Time.now }
      let(:watered_time) { 4.minutes.ago }
      it { is_expected.to eq false }
    end
  end

  describe '#age' do
    subject { plant.age }

    let(:fed_time) { 1.minutes.ago }
    let(:watered_time) { 1.minutes.ago }

    context 'when growth is zero' do
      let(:water) { 0 }
      let(:food) { 0 }

      it { is_expected.to eq 'baby' }
    end

    context 'when growth is greater than zero and less than 20' do
      let(:water) { 5 }
      let(:food) { 5 }

      it { is_expected.to eq 'young adult' }
    end

    context 'when growth is greater than or equal to 20' do
      let(:water) { 10 }
      let(:food) { 10 }

      it { is_expected.to eq 'full grown' }
    end
  end
end
