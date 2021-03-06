feature 'Testing:' do
  scenario 'Can run app and check page content' do
    visit('/')
    expect(page).to have_content 'Rock Paper Scissors'
  end
end

feature 'Name entry:' do
  scenario 'player can enter name' do
    visit('/')
    fill_in :player_1_name, with: 'Dog'
    click_button 'Submit'
    expect(page).to have_content 'Dog vs. Computer'
  end

  scenario '2nd player can enter name' do
    visit('/')
    fill_in :player_1_name, with: 'Dog'
    fill_in :player_2_name, with: 'Cat'
    click_button 'Submit'
    expect(page).to have_content 'Dog vs. Cat'
  end
end


feature 'Gameplay:' do

  scenario 'user presented with options' do
    visit('/')
    fill_in :player_1_name, with: 'Dog'
    click_button 'Submit'
    expect(page).to have_content 'Rock, Paper or Scissors?'
  end

  xscenario 'user can pick move rock' do
    visit('/')
    fill_in :player_1_name, with: 'Dog'
    click_button 'Submit'
    click_button 'Rock'
    expect(page).to have_content 'Dog says Rock!'
  end

  xscenario 'user can pick move paper' do
    visit('/')
    fill_in :player_1_name, with: 'Dog'
    click_button 'Submit'
    click_button 'Paper'
    expect(page).to have_content 'Dog says Paper!'
  end

  xscenario 'user can pick move scissors' do
    visit('/')
    fill_in :player_1_name, with: 'Dog'
    click_button 'Submit'
    click_button 'Scissors'
    expect(page).to have_content 'Dog says Scissors!'
  end

  # the game will choose a random option
  scenario 'computer picks random move' do
    allow(Computer).to receive(:go).and_return("Rock")
    visit('/')
    fill_in :player_1_name, with: 'Dog'
    click_button 'Submit'
    click_button 'Rock'
    expect(page).to have_content 'Computer says Rock!'
  end

  # a winner will be declared
  xscenario 'winner declared' do
    allow(Computer).to receive(:go).and_return("Scissors")
    visit('/')
    fill_in :player_1_name, with: 'Dog'
    click_button 'Submit'
    click_button 'Rock'
    expect(page).to have_content 'Dog wins!'
  end

end
