require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  def setup
    @post = posts(:orange)
  end

  test "should redirect create when not admin" do
    assert_no_difference 'Post.count' do
      post :create, micropost: { title: "Lorem ipsum"}
    end
    assert_redirected_to root_url
  end

  test "should redirect destroy when not admin" do
    assert_no_difference 'Post.count' do
      delete :destroy, id: @post
    end
    assert_redirected_to root_url
  end
end
