#!/usr/bin/env bash

dirnow=$(dirname $(realpath $0))
dirroot=$(realpath "$dirnow/../..")
printf "\n --- ROOT directory: $dirroot \n"


# sed -i -r "s/^\t \* \@ticket ([0-9]{5})/\t \* \@see https\:\/\/core\.trac\.wordpress\.org\/ticket\/\1/g" tests/l10n/loadTextdomain.php


cd $dirroot/tests/phpunit

# ticketfiles
tfiles=$(grep -P " \* @ticket ([0-9]{5})" -rl | sort -u | sort)
sfiles=$(grep -P " \* @since ([0-9])\." -rl | sort -u | sort)

allfiles=$(printf "$tfiles\n$sfiles" | sort -u | sort)

for afile in $allfiles; do
	afile=$(realpath $afile)

	printf "\n $afile"
	# sed -i -r "s/\t \* \@since ([0-9])\./\t \* \@since WP\-\1\./g" $afile
	# sed -i -r "s/ \* \@since ([0-9])\./ \* \@since WP\-\1\./g" $afile

	# sed -i -r "s/ \* \@since([\s]+)([0-9]*)\./ * @since\1WP-\2\./g" $afile
	# sed -i -r "s/(\t+)? \* \@since([\s]+)([0-9]*)\./\1 * @since\2WP-\3\./g" $afile


	# ticket links

	# wordpress to classicpress
	sed -i -r "s/[\n|\s]WordPress[\n|\s])/\1ClassicPress\2/g" $afile
done

printf "\n\n"
# grep -n "@since" * -r | grep -v "WP\|UT"

printf "\n\n"
grep -n "WordPress" * -r

printf "\n\n"
