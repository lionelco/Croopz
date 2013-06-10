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

describe OccurrencesController do

  # This should return the minimal set of attributes required to create a valid
  # Occurrence. As you add validations to Occurrence, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # OccurrencesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all occurrences as @occurrences" do
      occurrence = Occurrence.create! valid_attributes
      get :index, {}, valid_session
      assigns(:occurrences).should eq([occurrence])
    end
  end

  describe "GET show" do
    it "assigns the requested occurrence as @occurrence" do
      occurrence = Occurrence.create! valid_attributes
      get :show, {:id => occurrence.to_param}, valid_session
      assigns(:occurrence).should eq(occurrence)
    end
  end

  describe "GET new" do
    it "assigns a new occurrence as @occurrence" do
      get :new, {}, valid_session
      assigns(:occurrence).should be_a_new(Occurrence)
    end
  end

  describe "GET edit" do
    it "assigns the requested occurrence as @occurrence" do
      occurrence = Occurrence.create! valid_attributes
      get :edit, {:id => occurrence.to_param}, valid_session
      assigns(:occurrence).should eq(occurrence)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Occurrence" do
        expect {
          post :create, {:occurrence => valid_attributes}, valid_session
        }.to change(Occurrence, :count).by(1)
      end

      it "assigns a newly created occurrence as @occurrence" do
        post :create, {:occurrence => valid_attributes}, valid_session
        assigns(:occurrence).should be_a(Occurrence)
        assigns(:occurrence).should be_persisted
      end

      it "redirects to the created occurrence" do
        post :create, {:occurrence => valid_attributes}, valid_session
        response.should redirect_to(Occurrence.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved occurrence as @occurrence" do
        # Trigger the behavior that occurs when invalid params are submitted
        Occurrence.any_instance.stub(:save).and_return(false)
        post :create, {:occurrence => {}}, valid_session
        assigns(:occurrence).should be_a_new(Occurrence)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Occurrence.any_instance.stub(:save).and_return(false)
        post :create, {:occurrence => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested occurrence" do
        occurrence = Occurrence.create! valid_attributes
        # Assuming there are no other occurrences in the database, this
        # specifies that the Occurrence created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Occurrence.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => occurrence.to_param, :occurrence => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested occurrence as @occurrence" do
        occurrence = Occurrence.create! valid_attributes
        put :update, {:id => occurrence.to_param, :occurrence => valid_attributes}, valid_session
        assigns(:occurrence).should eq(occurrence)
      end

      it "redirects to the occurrence" do
        occurrence = Occurrence.create! valid_attributes
        put :update, {:id => occurrence.to_param, :occurrence => valid_attributes}, valid_session
        response.should redirect_to(occurrence)
      end
    end

    describe "with invalid params" do
      it "assigns the occurrence as @occurrence" do
        occurrence = Occurrence.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Occurrence.any_instance.stub(:save).and_return(false)
        put :update, {:id => occurrence.to_param, :occurrence => {}}, valid_session
        assigns(:occurrence).should eq(occurrence)
      end

      it "re-renders the 'edit' template" do
        occurrence = Occurrence.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Occurrence.any_instance.stub(:save).and_return(false)
        put :update, {:id => occurrence.to_param, :occurrence => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested occurrence" do
      occurrence = Occurrence.create! valid_attributes
      expect {
        delete :destroy, {:id => occurrence.to_param}, valid_session
      }.to change(Occurrence, :count).by(-1)
    end

    it "redirects to the occurrences list" do
      occurrence = Occurrence.create! valid_attributes
      delete :destroy, {:id => occurrence.to_param}, valid_session
      response.should redirect_to(occurrences_url)
    end
  end

end
