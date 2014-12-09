class UsersController < ApplicationController

  before_filter :set_user, only: [:show, :edit, :update, :destroy, :send_picture, :show_pictures]
  # On saute une etape de securite si on appel SEND_PICTURE en JSON
  skip_before_filter :verify_authenticity_token, only: [:send_picture]

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  # POST /users/1/picture
  def send_picture
    @picture = Picture.new(picture_params)
    @picture.user = @user
    puts YAML::dump(@picture)

    @event = Event.find(params[:picture][:event_id])
    @picture.event = @event

    respond_to do |format|
      if @picture.save
        format.json
      else
        format.json {render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /users/1/pictures
  def show_pictures
    @pictures = Picture.where("user_id = 1").order("id ASC")

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pictures }
    end
  end

  # POST /users/check
  def is_right
    @user = User.find_by_name(params[:name])

    if @user.nil?
      respond_to do |format|
        format.html # new.html.erb
        format.json { respond_with( { :ok => false, :why => 'name'}.to_json )}
      end
    end

    if @user.password = params(:password)
      respond_to do |format|
        format.html # new.html.erb
        format.json { respond_with( { :ok => true}.to_json )}
      end
    else
      respond_to do |format|
        format.html # new.html.erb
        format.json { respond_with( { :ok => false, :why => 'password'}.to_json )}
      end
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def picture_params
      params.require(:picture).permit(:picture, :caption, :sent_date, :event_id)
    end
end
