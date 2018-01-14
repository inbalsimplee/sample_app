require 'spec_helper'

describe "Static pages" do

 
 let(:base_title) { "Ruby on Rails Tutorial Sample App" }

 subject {page}
 it "Should have the right links on the layout" do
    visit root_path

    click_link "About"
    should have_selector('title', text: full_title('About Us'))

    click_link "Help"
    should have_selector('title', text: full_title(''))

    click_link "Contact"
    should have_selector('title', text: full_title(''))

    click_link "Home"
    should have_selector('title', text: full_title(''))

    click_link "Sign up now!"

    click_link "sample app"


 end

 describe "Contact page" do
    let(:app_name) { 'Contact' }
    let(:full_t) { '' }

    before {visit contact_path}

    it { page.should have_selector('h1', text: app_name) }

    it { should have_selector('title',
                        text:  full_title(full_t)) }
    it { should have_selector('title', text: '| '+ app_name) }
  end

  
 
  describe "Home page" do
    let(:app_name) { "Home" }
    let(:full_t) { "" }
    before { visit root_path }
 
    it { should have_selector('h1', text: 'Sample App')}

    it { should have_selector('title', text: full_title(full_t)) }

    it { should_not have_selector('title', text: '| ' + app_name) }
  end

  describe "Help page" do
    
    let(:app_name) { "Help" }
    let(:full_t) { "" }

    before { visit help_path }
    it {
      page.should have_selector('h1', text: app_name) }

    it { should have_selector('title',
                        text: full_title(full_t)) }

    it { should have_selector('title', text: '| ' + app_name) }

  end

  describe "About page" do
    let(:app_name) { "About Us"}

    before { visit about_path }
    it  { should have_selector('h1', text: app_name) } 

    it  { should have_selector('title',
                    text: "#{base_title}") }

    it { should have_selector('title', text: '| ' + app_name) }

  end
end