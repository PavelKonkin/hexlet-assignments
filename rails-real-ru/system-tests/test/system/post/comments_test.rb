require "application_system_test_case"

class Post::CommentsTest < ApplicationSystemTestCase
  # fixtures 'post/comments'
  setup do
    @post = posts(:one)
    @comment = post_comments(:one)
  end
  
  test 'creating a Comment' do
    visit post_url @post

    fill_in "post_comment[body]", with: @comment.body

    click_on 'Create Comment'

    assert_text 'Comment was successfully created'
  end
  
  test 'destroying a Comment' do
    visit post_url @post
    accept_confirm do
      click_on 'Delete', match: :first
    end
    save_screenshot
    assert @post.comments.count.zero?
  end

  test 'updating a Comment' do
    visit post_url @post
    click_on 'Edit', match: :first

    fill_in "Body", with: @comment.body


    click_on 'Update Comment'

    assert_text 'Comment was successfully updated'
  end
end
