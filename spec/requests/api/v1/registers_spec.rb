require 'rails_helper'

RSpec.describe "Api::V1::Registers", type: :request do

  before { host! 'api.plamor-gerencial.dev' }
  let(:user) { create(:user) }
  let!(:auth_data) { user.create_new_auth_token }
  let(:headers) do
    {
      "content-Type": Mime[:json].to_s,
      "Accept": "application/vnd.plamorapi.v1",
      'access-token': auth_data['access-token'],
      'uid': auth_data['uid'],
      'client': auth_data['client']
    }
  end

  describe 'GET /registers' do
    context '#index' do
      before do
        create_list(:register, 10, user: user)
        get '/registers', params: {}, headers: headers
      end

      it 'return status code 200' do
        expect(response).to have_http_status(:ok)
      end
      it 'return the json list' do
        expect(json_body[:data].count).to eq(10)
      end
    end
  end

  describe 'GET /registers/:id' do
    context '#show' do
      let(:register) { create(:register, user: user) }
      before { get "/registers/#{register.id}", params: {}, headers: headers }
    end

    it 'return status code 200' do
      expect(response).to have_http_status(:ok)
    end
    # it 'return the json data' do
    #   expect(json_body[:data][:attributes][:name]).to eq(register.name)
    # end
  end

end
