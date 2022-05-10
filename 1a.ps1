$API_Key           = "XjQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX1M3gyeXNINF"
$API_Password      = "XDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXWJkSPaeX"

$login_json = '{
   "action":"login",
   "param":{
      "apikey":"XjQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX1M3gyeXNINF",
      "apipassword":"XDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXWJkSPaeX",
      "customernumber":"00000"
   }
}'

$login_Invoke = Invoke-RestMethod -Uri "https://ccp.netcup.net/run/webservice/servers/endpoint.php?JSON" -Method Post -ContentType "application/json" -Body $login_json -SessionVariable Session_Login -OutVariable Out_Login

$apisessionid = $login_Invoke.responsedata.apisessionid

$infoDnsRecords_json = '{
   "action":"infoDnsRecords",
   "param":{
      "domainname":"yourdomainhere.de",
      "customernumber":"00000",
      "apikey":"XjQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX1M3gyeXNINF",
      "apisessionid":"' + $apisessionid + '"
   }
}'

$infoDnsRecords_Invoke = Invoke-RestMethod -Uri "https://ccp.netcup.net/run/webservice/servers/endpoint.php?JSON" -Method Post -ContentType "application/json" -Body $infoDnsRecords_json -SessionVariable Session -OutVariable Out
$infoDnsRecords_Invoke.responsedata.dnsrecords

$logout_json = '{
   "action":"logout",
   "param":{
      "customernumber":"00000",
      "apikey":"XjQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX1M3gyeXNINF",
      "apisessionid":"' + $apisessionid + '"
   }
}'

$logout_Invoke = Invoke-RestMethod -Uri "https://ccp.netcup.net/run/webservice/servers/endpoint.php?JSON" -Method Post -ContentType "application/json" -Body $logout_json -SessionVariable Session_Logout -OutVariable Out_Logout
$logout_Invoke.responsedata
