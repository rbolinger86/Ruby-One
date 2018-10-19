require 'rubygems'
require 'twilio-ruby'
account_sid = "ACa9dd1155a9ba8798a9a7cdf5f2760f20"
auth_token = "facd3f687cac21e91ed0e14262502066"
@client = Twilio::REST::Client.new(account_sid, auth_token)
puts "What question would you like answered?"
question = gets
puts "Your answer to the question '#{question}' will be texted to you."
answers = ["Outcome Likely", "Don't Count On it!", "Don't Hold Your Breath!", "Looks Good!", "Outcome Unclear", "Unsure", "Yes", "No", "No Way!", "Absolutely!"]
answer = answers.sample
message = @client.api.account.messages.create(
  from: "+19132708654",
  to: "+18162897960",
  body: answer
)
puts message.to
