#!/usr/bin/env bash
# Based on https://github.com/drduh/blocklists/blob/master/generate-easylists.sh. 
# https://github.com/b3ncha/blocklists/generate-adguard.sh

for list in $(find corporations -type f \
	! -name "README*" ! -name "*.easylist*" ! -name "*.ipv6" ! -name "*.AdGuard") ; do

	adguard="${list}.AdGuard" && printf "creating ${adguard}\n"

	printf "![AdGuard Filter]\n" > ${adguard}
	for ip in $(grep "0.0.0.0" ${list} | awk '{print $2}' | sort) ; do
			printf "||${ip}^\$important\n"
	done >> ${adguard}
done
