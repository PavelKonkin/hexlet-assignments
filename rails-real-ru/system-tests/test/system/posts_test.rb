# frozen_string_literal: true

require 'application_system_test_case'

# BEGIN
class PostsTest < ApplicationSystemTestCase
    setup do
      @post = posts(:one)
    end
    
    test "visiting the index" do
      visit posts_path
    
      assert_selector "h1", text: "Posts"
    end

    test "visiting the post page" do
      visit post_path @post
      assert_selector "h1", text: @post.title
    end

    test 'creating a Post' do
      visit posts_url
      click_on 'New Post'

      fill_in "Title", with: @post.title
      fill_in "Body", with: @post.body

      click_on 'Create Post'

      assert_text 'Post was successfully created'
    end

    test 'updating a Post' do
      visit posts_url
      click_on 'Edit', match: :first

      fill_in "Body", with: @post.body


      click_on 'Update Post'

      assert_text 'Post was successfully updated'
    end

    test 'destroying a Post' do
      visit posts_url
      page.accept_confirm do
        click_on 'Destroy', match: :first
      end

      assert_text 'Post was successfully destroyed'
    end
end
# END
