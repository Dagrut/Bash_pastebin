#!/bin/bash

TMPDIR='/tmp/bash_pastebin'

mkdir -p "$TMPDIR"

# Functions
debug() {
	echo "$@" 1>&2
}

show_error() {
	output="$@"
	clen=$(echo "$output" | wc -c)
	echo -ne 'HTTP/1.0 400 Bad request\r\n'
	echo -ne "Content-Length: $clen\r\n"
	echo -ne '\r\n'
	echo "$output"
}

show_ok() {
	echo -ne 'HTTP/1.0 200 OK\r\n'
	echo -ne 'Content-Length: 0\r\n'
	echo -ne '\r\n'
}

show_file() {
	f="$1"
	clen=$(cat "$f" | wc -c)
	echo -ne 'HTTP/1.0 200 Ok\r\n'
	echo -ne "Content-Length: $clen\r\n"
	echo -ne '\r\n'
	cat "$f"
}

show_list() {
	output=''
	output=$(ls -1 "$TMPDIR" | while read -d $'\n' line; do
		echo "$line" | base64 -d | sed -e 's~^/~~'
	done)
	clen=$(echo -n "$output" | wc -c)
	echo -ne 'HTTP/1.0 200 Ok\r\n'
	echo -ne "Content-Length: $clen\r\n"
	echo -ne '\r\n'
	echo -n "$output"
}

show_form() {
	show_file "./page.html"
}

# Init
contentlength=0
is_ajax='no'

read -d $'\n' line

req=$(echo "$line" | cut -d' ' -f1 | tr 'a-z' 'A-Z')
url=$(echo "$line" | cut -d' ' -f2 | base64)

# Read headers
while read -d $'\n' line; do
	if echo $line | tr -d '\r' | grep -q '^$'; then
		break
	elif echo $line | grep -qFe 'X-Bash-Pastebin-Ajax'; then
		is_ajax='yes'
	elif echo $line | grep -qie '^content-length'; then
		contentlength=$(echo "$line" | tr -c -d '0-9')
	fi
done

# Sending response back
if [ "$req" = "GET" ]; then
	if [ "$is_ajax" = 'no' ]; then
		show_form
	elif [ -e "$TMPDIR/$url" ]; then
		show_file "$TMPDIR/$url"
	else
		show_ok
	fi
elif [ "$req" = "PUT" ]; then
	head -c "$contentlength" > "$TMPDIR/$url"
	show_ok
elif [ "$req" = "LIST" ]; then
	show_list
elif [ "$req" = "DELETE" ]; then
	rm -f "$TMPDIR/$url"
	show_ok
else
	show_error "Unknown method ($req)"
fi
