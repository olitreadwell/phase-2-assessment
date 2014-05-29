get '/' do
    #These are params if there was an error (otherwise nil)
    # session.clear
    # @login_error = params[:params_login]
    # @register_error = params[:params_registration]
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
    first_name = params[:first_name]
    last_name = params[:last_name]
    image_url = params[:image_url]
    email = params[:email]
    password = params[:password]

    if Student.find_by_email(email)
        redirect to '/?params_registration=There was an error with registration'
    else
        @student = Student.create(first_name: first_name,
                                                       last_name: last_name,
                                                       image_url: image_url,
                                                       email: email)
        @student.password = password
        @student.save
        if @student.save
            session[:student_id] = @student.id
            redirect "/students/#{session[:student_id]}"
        else
            redirect to '/?params_registration=There was an error with registration'
        end
    end
end


get '/students/:id' do
    @student = Student.find_by_id(session[:student_id])
    @first_name = @student.first_name
    erb :student_home
end

post '/students/logout' do
    session.clear
    redirect '/'
end


