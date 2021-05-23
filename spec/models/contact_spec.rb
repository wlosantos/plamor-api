require 'rails_helper'

RSpec.describe Contact, type: :model do

  describe 'model' do
    context 'database columns' do
      it { is_expected.to respond_to :kind }
      it { is_expected.to respond_to :description }
      it { is_expected.to respond_to :status }
    end

    context 'validations' do
      it { is_expected.to validate_presence_of :description }
      it { should define_enum_for(:kind).with_values(%i[ cell phone email whatsapp ])}
      it { should define_enum_for(:status).with_values(%i[ active inactive ])}
    end

    context 'associations' do
      it { is_expected.to belong_to :register }
    end

    context 'new contact' do
      let(:register) { create(:register) }
      let(:contact) { create(:contact) }

      it 'successfully' do
        expect(contact).to be_valid
      end
    end
  end

end
