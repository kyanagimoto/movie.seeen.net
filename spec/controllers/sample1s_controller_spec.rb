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

describe Sample1sController do

  # This should return the minimal set of attributes required to create a valid
  # Sample1. As you add validations to Sample1, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Sample1sController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all sample1s as @sample1s" do
      sample1 = Sample1.create! valid_attributes
      get :index, {}, valid_session
      assigns(:sample1s).should eq([sample1])
    end
  end

  describe "GET show" do
    it "assigns the requested sample1 as @sample1" do
      sample1 = Sample1.create! valid_attributes
      get :show, {:id => sample1.to_param}, valid_session
      assigns(:sample1).should eq(sample1)
    end
  end

  describe "GET new" do
    it "assigns a new sample1 as @sample1" do
      get :new, {}, valid_session
      assigns(:sample1).should be_a_new(Sample1)
    end
  end

  describe "GET edit" do
    it "assigns the requested sample1 as @sample1" do
      sample1 = Sample1.create! valid_attributes
      get :edit, {:id => sample1.to_param}, valid_session
      assigns(:sample1).should eq(sample1)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Sample1" do
        expect {
          post :create, {:sample1 => valid_attributes}, valid_session
        }.to change(Sample1, :count).by(1)
      end

      it "assigns a newly created sample1 as @sample1" do
        post :create, {:sample1 => valid_attributes}, valid_session
        assigns(:sample1).should be_a(Sample1)
        assigns(:sample1).should be_persisted
      end

      it "redirects to the created sample1" do
        post :create, {:sample1 => valid_attributes}, valid_session
        response.should redirect_to(Sample1.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved sample1 as @sample1" do
        # Trigger the behavior that occurs when invalid params are submitted
        Sample1.any_instance.stub(:save).and_return(false)
        post :create, {:sample1 => {}}, valid_session
        assigns(:sample1).should be_a_new(Sample1)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Sample1.any_instance.stub(:save).and_return(false)
        post :create, {:sample1 => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested sample1" do
        sample1 = Sample1.create! valid_attributes
        # Assuming there are no other sample1s in the database, this
        # specifies that the Sample1 created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Sample1.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => sample1.to_param, :sample1 => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested sample1 as @sample1" do
        sample1 = Sample1.create! valid_attributes
        put :update, {:id => sample1.to_param, :sample1 => valid_attributes}, valid_session
        assigns(:sample1).should eq(sample1)
      end

      it "redirects to the sample1" do
        sample1 = Sample1.create! valid_attributes
        put :update, {:id => sample1.to_param, :sample1 => valid_attributes}, valid_session
        response.should redirect_to(sample1)
      end
    end

    describe "with invalid params" do
      it "assigns the sample1 as @sample1" do
        sample1 = Sample1.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Sample1.any_instance.stub(:save).and_return(false)
        put :update, {:id => sample1.to_param, :sample1 => {}}, valid_session
        assigns(:sample1).should eq(sample1)
      end

      it "re-renders the 'edit' template" do
        sample1 = Sample1.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Sample1.any_instance.stub(:save).and_return(false)
        put :update, {:id => sample1.to_param, :sample1 => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested sample1" do
      sample1 = Sample1.create! valid_attributes
      expect {
        delete :destroy, {:id => sample1.to_param}, valid_session
      }.to change(Sample1, :count).by(-1)
    end

    it "redirects to the sample1s list" do
      sample1 = Sample1.create! valid_attributes
      delete :destroy, {:id => sample1.to_param}, valid_session
      response.should redirect_to(sample1s_url)
    end
  end

end
