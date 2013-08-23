describe "routing" do
  it "routes /home to pages#home" do
  	expect(get: '/home').to route_to(
  		controller: 'pages',
  		action: 'home')
  end
end