for i in `find */ubuntu/dists -type f -regex ".*/Release" -printf "%h\n"`; do
	SHORT=`echo $i | grep binary-amd64 | sed 's|binary-amd64||'`

	# Package Hashes
	wget --timestamping --recursive --no-parent --no-verbose --execute robots=off --reject "index.html*" --level 1 "http://$SHORT/binary-amd64/by-hash/SHA256/"
	wget --timestamping --recursive --no-parent --no-verbose --execute robots=off --reject "index.html*" --level 1 "http://$SHORT/binary-i386/by-hash/SHA256/"

	# CNF Data
	wget --timestamping --recursive --no-parent --no-verbose --execute robots=off --reject "index.html*" --level 1 "http://$SHORT/cnf/"

	# CNF By hash data
	wget --timestamping --recursive --no-parent --no-verbose --execute robots=off --reject "index.html*" --level 1 "http://$SHORT/cnf/by-hash/SHA256"
	wget --timestamping --recursive --no-parent --no-verbose --execute robots=off --reject "index.html*" --level 1 "http://$SHORT/i18n/by-hash/SHA256"
	wget --timestamping --recursive --no-parent --no-verbose --execute robots=off --reject "index.html*" --level 1 "http://$SHORT/dep11/by-hash/SHA256"
done
