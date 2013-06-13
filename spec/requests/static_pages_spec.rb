require 'spec_helper'
include ApplicationHelper


describe "StaticPages" do
  #describe "GET /static_pages" do
    #it "works! (now write some real specs)" do
      #Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      #get static_pages_index_path
      #response.status.should be(200)
  let(:base_title) {"Here is"}
  
  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1',     text: heading)}
    #it { should have_selector('title',  text: full_title(page_title))}
  end

  describe "Home page" do
    before {visit root_path}
  	#it { should have_content('Sample App') }
	  #it { should have_selector('title',
    #    text: "Here is")}
    #it { should_not have_selector('title', text: '| Hhome')}
    let(:heading)  {'Sample App'}
    let(:page_title){""}

    it_should_behave_like "all static pages"
    #it {should_not have_selector 'title', text: '| Home'}
  end

  describe "Help page" do
    before {visit help_path}
    #it { should have_content('Help')}
    #it { should have_selector('title',
    #                    :text => "Here is | Help")}
    let(:heading) {'Help'}
    let(:page_title){"| Help"}
    it_should_behave_like "all static pages"
    #it {should_not have_selector 'title', text:'| Help'}
  end

  describe "About page" do
    before {visit about_path}
    #it { should have_content('About Us')}
    #it { should have_selector('title',
    #                :text => "Here is | About Us")}
    let(:heading){'About Us'}
    let(:page_title){"| About Us"}
    it_should_behave_like "all static pages"
    #it {should_not have_selector 'title', text:'| About Us'}
  end

  describe "Contact page" do
    before {visit contact_path}
    let(:heading){'Contact Us'}
    let(:page_title){"| Contact Us"}
    it_should_behave_like "all static pages"
    #it {should_not have_selector 'title', text:'| Contact Us'}    
  end
  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title('About Us')
    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')
    click_link "Contact"
    page.should have_selector 'title', text: full_title('Contact Us')
    click_link "Home"
    page.should have_selector 'title', text: full_title('Home')
    click_link "Sign up now!"
    page.should have_selector 'title', text: full_title('Sign up')
    click_link "sample app"
    page.should have_selector 'title', text: full_title('Home')
  end

end

describe ApplicationHelper do

  describe "full_title" do
    it "should include the page title" do
      full_title("foo").should =~ /foo/
    end

    it "should include the base title" do
      full_title("foo").should =~ /^Here is/
    end

    it "should not include a bar for the home page" do
      full_title("").should_not =~ /\|/
    end
  end
end