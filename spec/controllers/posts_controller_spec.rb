RSpec.describe PostsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "post create successful" do
      subject {
        post :create, params: {
          post: {
            subject: "test",
            body: "puutss"
          }
        }
      }
      it "redirect to post_path" do
        post :create, params: {
          post: {
            subject: "test",
            body: "puutss"
          }
        }
        post = Post.last
        expect(response).should redirect_to post_path(post)
      end
    end
    context "post create unsuccessful" do
        subject {
          post :create, params: {
            post: {
              subject: "",
              body: "puuuuuuuuuuu"
            }
          }
        }
      it "redirect to new_post_path" do
        expect(subject).to render_template(:new)
      end
    end
  end

end
