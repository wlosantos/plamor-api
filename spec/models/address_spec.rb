require 'rails_helper'

RSpec.describe Address, type: :model do

  describe 'model' do
    context 'database columns' do
      it { is_expected.to respond_to :street }
      it { is_expected.to respond_to :number }
      it { is_expected.to respond_to :complement }
      it { is_expected.to respond_to :neighborhood }
      it { is_expected.to respond_to :city }
      it { is_expected.to respond_to :state }
      it { is_expected.to respond_to :country }
      it { is_expected.to respond_to :zipcode }
      it { is_expected.to respond_to :register_id }
    end

    context 'validations' do
      it { is_expected.to validate_presence_of :street }
      it { is_expected.to validate_presence_of :number }
      it { is_expected.to validate_presence_of :zipcode }
      it { is_expected.to validate_presence_of :neighborhood }
      it { is_expected.to validate_presence_of :city }
      it { is_expected.to validate_presence_of :state }
      it { is_expected.to validate_presence_of :country }
    end

    context 'associations' do
      it { is_expected.to belong_to :register }
    end

    context 'register new address' do
      let(:register) { create(:register) }
      let(:address) { create(:address) }

      it 'successfully' do
        expect(address).to be_valid
      end
    end
  end

end
