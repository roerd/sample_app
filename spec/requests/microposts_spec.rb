require 'spec_helper'

describe "Microposts" do

  before(:each) do
    @user = Factory(:user)
    visit signin_path
    fill_in :email,    :with => @user.email
    fill_in :password, :with => @user.password
    click_button
  end

  describe "creation" do

    describe "failure" do

      it "should not make a new micropost" do
        lambda do
          visit root_path
          fill_in :micropost_content, :with => ""
          click_button
          response.should render_template('pages/home')
          response.should have_selector("div#error_explanation")
        end.should_not change(Micropost, :count)
      end

      describe "the sidebar microposts count" do

        describe "on the homepage" do
          
          it "should display 0 microposts" do
            visit root_path
            fill_in :micropost_content, :with => ""
            click_button
            response.should have_selector("span.microposts",
                                          :content => "0 microposts");
          end
        end

        describe "on the profile page" do
          
          it "should display Microposts and 0" do
            visit root_path
            fill_in :micropost_content, :with => ""
            click_button
            visit user_path(@user)
            response.should have_selector("td.sidebar",
                                          :content => "Microposts");
            response.should have_selector("td.sidebar",
                                          :content => "0");
          end
        end
      end
    end

    describe "success" do

      it "should make a new micropost" do
        content = "Lorem ipsum dolor sit amet"
        lambda do
          visit root_path
          fill_in :micropost_content, :with => content
          click_button
          response.should have_selector("span.content", :content => content)
        end.should change(Micropost, :count).by(1)
      end

      describe "the sidebar microposts count" do

        describe "on the homepage" do
          
          it "should display 1 micropost" do
            content = "Lorem ipsum dolor sit amet"
            visit root_path
            fill_in :micropost_content, :with => content
            click_button
            response.should have_selector("span.microposts",
                                          :content => "1 micropost");
          end
          
          it "should not display microposts (with plural 's')" do
            content = "Lorem ipsum dolor sit amet"
            visit root_path
            fill_in :micropost_content, :with => content
            click_button
            response.should_not have_selector("span.microposts",
                                              :content => "microposts");
          end
          
          it "should display 2 microposts" do
            visit root_path
            fill_in :micropost_content, :with => "Lorem ipsum dolor sit amet"
            click_button
            fill_in :micropost_content, :with => "consectetur, adipisci velit"
            click_button
            response.should have_selector("span.microposts",
                                          :content => "2 microposts");
          end
        end
        
        describe "on the profile page" do
          
          it "should display Microposts and 1" do
            content = "Lorem ipsum dolor sit amet"
            visit root_path
            fill_in :micropost_content, :with => content
            click_button
            visit user_path(@user)
            response.should have_selector("td.sidebar",
                                          :content => "Microposts");
            response.should have_selector("td.sidebar",
                                          :content => "1");
          end
          
          it "should display Microposts and 2" do
            visit root_path
            fill_in :micropost_content, :with => "Lorem ipsum dolor sit amet"
            click_button
            fill_in :micropost_content, :with => "consectetur, adipisci velit"
            click_button
            visit user_path(@user)
            response.should have_selector("td.sidebar",
                                          :content => "Microposts");
            response.should have_selector("td.sidebar",
                                          :content => "2");
          end
        end
      end
    end
  end
end
