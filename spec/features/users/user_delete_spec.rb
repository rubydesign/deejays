
# Feature: User delete
#   As a user
#   I want to delete my user profile
#   So I can close my account
feature 'User delete', :js , :devise  do

  # Scenario: User can delete own account
  #   Given I am signed in
  #   When I delete my account
  #   Then I should see an account deleted message
  scenario 'user can delete own account' do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    visit edit_user_registration_path(user)
    accept_alert do
      click_link 'Cancel my account'
    end
    expect(page).to have_content I18n.t 'devise.registrations.destroyed'
  end
  scenario 'admin can delete other account' do
    user = FactoryBot.create(:admin)
    other = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    visit edit_user_path(other)
    accept_alert do
      click_link 'Delete User'
    end
    expect(page).to have_content "User deleted"
    expect(page).to have_content user.full_name
  end

end
