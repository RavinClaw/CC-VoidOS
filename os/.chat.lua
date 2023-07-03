-- VoidOS Development (Chat.lua)
print("Connecting to Chat Service")
rednet.open("back")
rednet.broadcast("/connect.request -form -pocket")
id, message = rednet.recieve()

print("Connected")
while true do
  id, message = rednet.recieve()
  if not message == "" then
    print("[" .. id .. "]: " .. message)
  end
  input = read()
  rednet.broadcast(input)
end
