50.times do
  FactoryBot.create(:register, status: 'active', plain: 'holder', user: User.first)
end
