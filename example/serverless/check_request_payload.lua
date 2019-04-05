-- get request body
payload = kong.request.get_body()

-- init variables
first_name = nil
last_name = nil

-- get fields if request body is not nil
if (body ~= nil) then
    body_request = payload.person
    first_name = body_request.first_name
    last_name = body_request.last_name
end

-- to print error log
-- kong.log.err(\"Last Name is: \"\, last_name)

suspiciousFirstName = {"WWW"\, "XXXX"}
suspiciousLasttName = {"YYY"\, "AAAA"}

-- default flag
suspiciousFlag = false

-- simple check
for i=1\, 2 do
    if (first_name == suspiciousFirstName[i] and last_name == suspiciousLasttName[i]) then
        suspiciousFlag = true
        break
    end
end

-- redirect traffic if user is suspicious
if (suspiciousFlag) then
    ngx.var.upstream_uri = "/some/other/path"
end
