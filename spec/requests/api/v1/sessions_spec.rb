require 'rails_helper'

RSpec.describe "Sessions", type: :request do

  before { host! 'api.plamor-gerencial.dev' }
  let(:user) { create(:user) }
  let!(:auth_data) { user.create_new_auth_token }
  let(:sign_in_url) { '/api/sign_in' }
  let(:sign_out_url) { '/api/sign_out' }
  let(:headers) do
    {
      "content-Type": Mime[:json].to_s,
      "Accept": "application/vnd.plamorapi.v1",
      'access-token': auth_data['access-token'],
      'uid': auth_data['uid'],
      'client': auth_data['client']
    }
  end

  describe 'POST /auth/sign_in' do
    before { post '/auth/sign_in', params: credentials.to_json, headers: headers }

    context 'credential are correct' do
      let(:credentials) { { email: user.email, password: '123456' } }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the authentication data in the header' do
        expect(response.headers).to have_key('access-token')
        expect(response.headers).to have_key('uid')
        expect(response.headers).to have_key('client')
      end
    end

  end

end
