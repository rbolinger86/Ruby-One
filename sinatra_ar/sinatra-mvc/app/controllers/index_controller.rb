require 'sinatra'

def birthpath (birthdate)
  number = birthdate[0].to_i+birthdate[1].to_i+birthdate[2].to_i+birthdate[3].to_i+birthdate[4].to_i+birthdate[5].to_i+birthdate[6].to_i+birthdate[7].to_i
  number = number.to_s
  number = number[0].to_i+number[1].to_i
  if number > 9
  number = number[0].to_i+number[1].to_i
end
return number
end
def get_birth_number (birth_number)
  case birth_number
  when 1
    message = "Your numerology number is #{birth_number}.\nOne is the leader. The number one indicates the ability to stand alone and is a strong vibration. Ruled by the Sun."
  when 2
    message = "Your numerology number is #{birth_number}.\nThis is the mediator and peace-lover. The number two indicates the desire for harmony. It is a gentle, considerate, and sensitive vibration. Ruled by the Moon."
  when 3
    message = "Your numerology number is #{birth_number}.\nNumber Three is a sociable, friendly, and outgoing vibration. Kind, positive, and optimistic, Three's enjoy life and have a good sense of humor. Ruled by Jupiter."
  when 4
    message = "Your numerology number is #{birth_number}.\nThis is the worker. Practical, with a love of detail, Fours are trustworthy, hard-working, and helpful. Ruled by Uranus."
  when 5
    message = "Your numerology number is #{birth_number}.\nThis is the freedom lover. The number five is an intellectual vibration. These are 'idea' people with a love of variety and the ability to adapt to most situations. Ruled by Mercury."
  when 6
    message = "Your numerology number is #{birth_number}.\nThis is the peace lover. The number six is a loving, stable, and harmonious vibration. Ruled by Venus."
  when 7
    message = "Your numerology number is #{birth_number}.\nThis is the deep thinker. The number seven is a spiritual vibration. These people are not very attached to material things, are introspective, and generally quiet. Ruled by Neptune."
  when 8
    message = "Your numerology number is #{birth_number}.\nThis is the manager. Number Eight is a strong, successful, and material vibration. Ruled by Saturn."
  when 9
    message = "Your numerology number is #{birth_number}.\nThis is the teacher. Number Nine is a tolerant, somewhat impractical, and sympathetic vibration. Ruled by Mars."
  else
    message = "Uh oh! Your birth path number is not 1-9!"
  end
end

def setup_index_view
  birthdate = params[:birthdate].gsub("-","")
  birth_number = birthpath(birthdate)
  @message = get_birth_number(birth_number)
  erb :index
end

def valid_birthdate (input)
  if input.length == 8 && input.match(/^[0-9]+[0-9]$/)
    return true
  else
    return false
  end
end

get '/' do
  erb :form
end

post '/' do
  birthdate = params[:birthdate].gsub("-","")
  if valid_birthdate(birthdate)
    birth_number = birthpath(params[:birthdate])
    redirect "/message/#{birth_number}"
  else
    @error = "Sorry, your input was invalid. Please try again!"
    erb :form
  end
end

get '/message/:birth_number' do
  birth_number = params[:birth_number].to_i
  @message = get_birth_number(birth_number)
  erb :index
end

get '/:birthdate' do
  return setup_index_view
end

get '/newpage' do
  @message = "Hey, what are you doin' here!?"
  erb :newpage
end
