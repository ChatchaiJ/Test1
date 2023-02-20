#!/bin/sh

URL="https://turtle.cjv6.net/~cj/github/Test1/webhook.php"

data="{\"ref\": \"refname\"}"

sig=$(	echo -n "${data}" |\
		openssl dgst -sha1 -hmac "" |\
		awk '{ print "X-Hub-Signature: sha1="$2}' )

curl -X POST \
	-H "Content-Type: application/json" \
	-H "${sig}" \
	-H "X-Github-Event: completed" \
	--data "${data}" \
	-s $URL
