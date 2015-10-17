# Add your own custom plugins in the custom/plugins directory. Plugins placed
# here will override ones with the same name in the main plugins directory.

md5file() {
	if [[ $# == 0 ]] || [[ $# > 2 ]] || [[ ! -f "$1" ]]; then
		echo "usage: md5file [path to file] [given md5sum]"
		return
	fi

	if [[ $# == 1 ]]; then
		echo "$(md5sum $1)" | tee "$1".md5

	elif [[ $# == 2 ]] && [[ ! -f "$2" ]]; then
		echo "$2" "$(basename $1)" | tee "$1".md5

	fi

	md5sum -c "$1".md5
}

sha1file() {
	if [[ $# == 0 ]] || [[ $# > 2 ]] || [[ ! -f "$1" ]]; then
		echo "usage: sha1file [path to file] [given sha1sum]"
		return
	fi

	if [[ $# == 1 ]]; then
		echo "$(sha1sum $1)" | tee "$1".sha1

	elif [[ $# == 2 ]] && [[ ! -f "$2" ]]; then
		echo "$2" "$(basename $1)" | tee "$1".sha1

	fi

	sha1sum -c "$1".sha1
}

sha3file() {
	if [[ $# == 0 ]] || [[ $# > 2 ]] || [[ ! -f "$1" ]]; then
		echo "usage: sha3file [path to file] [given sha1sum]"
		return
	fi

	if [[ $# == 1 ]]; then
		rhash --sha3-512 $1 > $1.sha3

	elif [[ $# == 2 ]] && [[ ! -f "$2" ]]; then
		echo "$2" "$(basename $1)" | tee "$1".sha3

	fi

	rhash -c "$1".sha3
}
