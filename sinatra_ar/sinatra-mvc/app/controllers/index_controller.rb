get '/:birthdate' do
  setup_index_view
end

get '/message/:birth_number' do
  birth_number = params[:birth_number].to_i
  @message = Person.get_birth_number(birth_number)
  erb :index
end

get '/' do
  erb :form
end

post '/' do
  birthdate = params[:birthdate].gsub("-","")
  if Person.valid_birthdate(birthdate)
    birth_number = Person.birthpath(params[:birthdate])
    redirect "/message/#{birth_number}"
  else
    @error = "Sorry, your input was invalid. Please try again!"
    erb :form
  end
end

def setup_index_view
	birthdate = params[:birthdate]
	birth_number = Person.birthpath(birthdate)
	@message = Person.get_birth_number(birth_number)
  erb :index
end

get '/newpage' do
  @message = "Hey, what are you doin' here!?"
  erb :newpage
end
