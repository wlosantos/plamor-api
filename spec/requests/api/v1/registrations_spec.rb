require 'rails_helper'

RSpec.describe "Api::V1::Registrations", type: :request do

  before(:each) do
    host! 'api.plamor-gerencial.dev'
    @sign_up_url = '/auth'
    @sign_params = { email: 'example@email.com', password: '123456', password_confirmation: '123456' }
  end

  let(:headers) do
    {
      "content-Type": Mime[:json].to_s,
      "Accept": "application/vnd.plamorapi.v1"
    }
  end

  describe 'email registration' do
    describe 'POST /auth' do

      context 'when sign_up params is valid' do
        before { post @sign_up_url, params: @sign_params.to_json, headers: headers }

        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end
      end

      context 'when sign_up params is invalid' do
        before { post @sign_up_url }

        it 'returns status code 422' do
          expect(response).to have_http_status(422)
        end
      end

      context 'returns authentication headers' do
        before { post @sign_up_url, params: @sign_params.to_json, headers: headers }

        it 'headers access-token' do
          expect(response.headers['access-token']).to be_present
        end
        it 'headers client' do
          expect(response.headers['client']).to be_present
        end
        it 'headers uid' do
          expect(response.headers['uid']).to be_present
        end
        it 'headers expiry' do
          expect(response.headers['expiry']).to be_present
        end
        it 'status success' do
          expect(json_body[:status]).to eq 'success'
        end
      end

    end
  end

  describe 'create user' do

    it 'successfuly' do
      expect { post @sign_up_url, params: @sign_params.merge({email: 'test@email.com'}).to_json, headers: headers }.to change(User, :count).by(1)
    end


  end

end
