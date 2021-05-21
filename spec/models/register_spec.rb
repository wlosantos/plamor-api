require 'rails_helper'

RSpec.describe Register, type: :model do

  describe 'model' do
    context 'database columns' do
      it { is_expected.to respond_to :name }
      it { is_expected.to respond_to :contract }
      it { is_expected.to respond_to :cpf }
      it { is_expected.to respond_to :rg }
      it { is_expected.to respond_to :birth }
      it { is_expected.to respond_to :plain }
      it { is_expected.to respond_to :parent_id }
      it { is_expected.to respond_to :status }
      it { is_expected.to respond_to :user_id }
    end

    context 'validations' do
      it { is_expected.to validate_presence_of :name }
      it { is_expected.to validate_presence_of :contract }
      it { is_expected.to validate_presence_of :birth }
      it { should define_enum_for(:plain).with_values(%i[ holder dependent ])}
      it { should define_enum_for(:status).with_values(%i[ active inactive ])}
    end

    context 'associations' do
      it { is_expected.to belong_to :user }
    end

    context 'new register' do
      let(:user) { create(:user) }
      let(:register) { create(:register, user: user) }

      it 'successfully' do
        expect(register).to be_valid
      end
      it 'failure' do
        register.user_id = nil
        expect(register).to_not be_valid
      end
    end

    context 'cpf validate' do
      let(:user) { create(:user) }
      let(:register) { create(:register, user: user) }

      it 'success' do
        expect(register).to be_valid
      end

    end
  end

end
