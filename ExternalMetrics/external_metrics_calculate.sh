#!/bin/sh
cd jmeter

echo  "Versions, No. of commits, No. of Contributors ,No. of Lines changed,No. of Bugs " >> ../external_metrics.csv
for version in v3_1 v3_0 v2_13 v2_11 v2_10 v2_9 v2_8 v2_7 v2_6 v2_5_1 v2_5 v2_3_4 v2_3_3 v2_3_2 v2_3
do
	A=$version
	git checkout $version
	B=$(git rev-list --count $version)
	C=$(git shortlog -s -n | wc -l)
	D=$(git whatchanged  --format=oneline | wc -l)
	E=$(git log --pretty=oneline | sed -n '/^[a-z0-9]* Bug /p' | wc -l)
	echo  "$A, $B ,$C ,$D, $E" >> ../external_metrics.csv
done
