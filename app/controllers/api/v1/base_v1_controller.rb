class Api::V1::BaseV1Controller < ApplicationController

  before_action :authenticate_user!

end
