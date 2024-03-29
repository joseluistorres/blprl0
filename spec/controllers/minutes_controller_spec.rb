require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe MinutesController do

  # This should return the minimal set of attributes required to create a valid
  # Minute. As you add validations to Minute, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all minutes as @minutes" do
      minute = Minute.create! valid_attributes
      get :index
      assigns(:minutes).should eq([minute])
    end
  end

  describe "GET show" do
    it "assigns the requested minute as @minute" do
      minute = Minute.create! valid_attributes
      get :show, :id => minute.id.to_s
      assigns(:minute).should eq(minute)
    end
  end

  describe "GET new" do
    it "assigns a new minute as @minute" do
      get :new
      assigns(:minute).should be_a_new(Minute)
    end
  end

  describe "GET edit" do
    it "assigns the requested minute as @minute" do
      minute = Minute.create! valid_attributes
      get :edit, :id => minute.id.to_s
      assigns(:minute).should eq(minute)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Minute" do
        expect {
          post :create, :minute => valid_attributes
        }.to change(Minute, :count).by(1)
      end

      it "assigns a newly created minute as @minute" do
        post :create, :minute => valid_attributes
        assigns(:minute).should be_a(Minute)
        assigns(:minute).should be_persisted
      end

      it "redirects to the created minute" do
        post :create, :minute => valid_attributes
        response.should redirect_to(Minute.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved minute as @minute" do
        # Trigger the behavior that occurs when invalid params are submitted
        Minute.any_instance.stub(:save).and_return(false)
        post :create, :minute => {}
        assigns(:minute).should be_a_new(Minute)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Minute.any_instance.stub(:save).and_return(false)
        post :create, :minute => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested minute" do
        minute = Minute.create! valid_attributes
        # Assuming there are no other minutes in the database, this
        # specifies that the Minute created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Minute.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => minute.id, :minute => {'these' => 'params'}
      end

      it "assigns the requested minute as @minute" do
        minute = Minute.create! valid_attributes
        put :update, :id => minute.id, :minute => valid_attributes
        assigns(:minute).should eq(minute)
      end

      it "redirects to the minute" do
        minute = Minute.create! valid_attributes
        put :update, :id => minute.id, :minute => valid_attributes
        response.should redirect_to(minute)
      end
    end

    describe "with invalid params" do
      it "assigns the minute as @minute" do
        minute = Minute.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Minute.any_instance.stub(:save).and_return(false)
        put :update, :id => minute.id.to_s, :minute => {}
        assigns(:minute).should eq(minute)
      end

      it "re-renders the 'edit' template" do
        minute = Minute.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Minute.any_instance.stub(:save).and_return(false)
        put :update, :id => minute.id.to_s, :minute => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested minute" do
      minute = Minute.create! valid_attributes
      expect {
        delete :destroy, :id => minute.id.to_s
      }.to change(Minute, :count).by(-1)
    end

    it "redirects to the minutes list" do
      minute = Minute.create! valid_attributes
      delete :destroy, :id => minute.id.to_s
      response.should redirect_to(minutes_url)
    end
  end

end
