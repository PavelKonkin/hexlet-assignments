require "test_helper"

class Posts::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post_comment = post_comments(:one)
    @post = posts(:one)
  end

  test "should get new" do
    get new_post_comment_url @post
    assert_response :success
  end

  test "should create post_comment" do
    assert_difference("PostComment.count") do
      post post_comments_path @post, params: { post_comment: { body: @post_comment.body, post_id: @post.id, id: 3} }
    end

    assert_redirected_to post_url(@post)
  end

  test "should get edit" do
    get edit_post_comment_url(@post_comment.post_id, @post_comment)
    assert_response :success
  end

  test "should update post_comment" do
    patch post_comment_url(@post_comment.post_id, @post_comment), params: { post_comment: { body: @post_comment.body, post_id: @post_comment.post_id } }
    assert_redirected_to post_url(@post_comment.post_id)
  end

  test "should destroy post_comment" do
    assert_difference("PostComment.count", -1) do
      delete post_comment_url(@post_comment.post_id, @post_comment)
    end

    assert_redirected_to post_url @post_comment.post_id
  end
end
