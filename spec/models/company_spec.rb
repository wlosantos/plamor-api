require 'rails_helper'

RSpec.describe Company, type: :model do

  describe 'model' do
    context 'database columns' do
      it { is_expected.to respond_to :name }
      it { is_expected.to respond_to :year_attained }
      it { is_expected.to respond_to :value_unit }
      it { is_expected.to respond_to :status }
    end

    context 'validations' do
      it { is_expected.to validate_presence_of :name }
      it { is_expected.to validate_presence_of :year_attained }
      it { is_expected.to validate_presence_of :value_unit }
      it { should define_enum_for(:status).with_values(%i[ active inactive ])}
    end

    context 'associations' do
      it { is_expected.to belong_to :user }
    end

    context 'be valid created' do
      let(:company) { create(:company) }

      it 'successfully' do
        expect(company).to be_valid
      end
    end
  end

end
