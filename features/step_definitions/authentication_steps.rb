Given("I visit the home page") do
    visit root_path
  end
  
  Given("I click the Sign up button") do
    click_link 'Sign up'
  end
  
  When("I fill the sign up form") do
    fill_in 'user_email', :with => 'test@test.test'
    fill_in 'user_password', :with => 'password'
    fill_in 'user_password_confirmation', :with => 'password'
  end
  
  When("I submit the sign up form") do
    click_button 'Sign up'
  end
  
  When("I confirm my email") do
    open_email('test@test.test')

    visit_in_email('Confirm my account')
  end
  
  Then("I should see that my email has been confirmed") do
    message = "Your email address has been successfully confirmed"

    expect(page).to have_content(message)
  end
  
  Given("I am a registered user") do
    @registered_user = FactoryBot.create(:user, 
                                  :email => 'test@test.test', 
                                  :password => 'password')
  end
  
  Given("I vist the home page") do
    visit root_path
  end
  
  When("I fill in the log in form") do
    fill_in 'user_email', :with => 'test@test.test'
    fill_in 'user_password', :with => 'password'

    click_button 'Log in'
  end
  
  Then("I should be logged in") do
    expect(page).to have_content("Signed in successfully")
  end
  
  Given("I am logged in") do
    visit root_path
    
    fill_in 'user_email', :with => 'test@test.test'
    fill_in 'user_password', :with => 'password'

    click_button 'Log in'
  end
  
  When("I click the log out button") do
    click_link "Log out"
  end
  
  Then("I should be redirected to the log in page") do
    expect(page).to have_content("Log in")
  end
