get '/' do
    #These are params if there was an error (otherwise nil)
    # session.clear
    @login_error = params[:params_login]
    @register_error = params[:params_registration]
  erb :index
end

post '/login' do
    email = params[:email]
    password = params[:password]
    if Student.authenticate(email, password)
        student = Student.find_by_email(email)
        session[:student_id] = (Student.find_by_email(email)).id
        redirect "/students/#{session[:student_id]}"
    else
        redirect '/?params_login=There was an error with login.'
    end

end

post '/register' do
    # first_name = params[:first_name]
    # last_name = params[:last_name]
    # image_url = params[:image_url]
    # email = params[:email]
    # password = params[:password]
    p params
    # if Student.find_by_email(email)
    #     redirect to '/?params_registration=There was an error with registration'
    # else
        @student = Student.new(first_name: params[:first_name],
                                            last_name: params[:last_name],
                                            image_url: params[:image_url],
                                            email: params[:email])
        @student.password = params[:password_confirmation]
        @student.save
        if @student.save
            session[:student_id] = @student.id
            redirect "/students/#{session[:student_id]}"
        else
            redirect to '/?params_registration=There was an error with registration'
        end
    # end
end

get '/students/logout' do
    session.clear
    redirect '/'
end

get '/students/:id' do
    @student = Student.find_by_id(session[:student_id])
    @first_name = @student.first_name
    @organizations = Organization.all
    erb :student_home
end

get '/organizations/new' do
    @org_creation_error = params[:params_org_creation]
    @organization = Organization.find_by_id(params[:organization_id])
    if request.xhr?
        content_type :json  # tells the client the server is responding with JSON
        current_student.to_json
      else
        erb :create_organization
      end
end

post '/organizations/new' do
    @organization = Organization.new(name: params[:organization_name],
                                                                description: params[:organization_description],
                                                                president_id: current_student.id)
    @organization.save
    if @organization.valid?
        redirect to "/organizations/#{@organization.id}"
    else
        redirect to "/organizations/new?params_org_creation=There was an error creating your organization"
    end
end

delete "/organizations/delete/:organization_id" do  # Delete
    @organization = Organization.find_by_id(params[:organization_id])
    @organization.delete
    redirect "/students/#{current_student.id}"
end

get '/organizations/:organization_id' do
    @organization = Organization.find_by_id(params[:organization_id])
    erb :show_organization
end