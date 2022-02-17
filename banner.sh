#!/bin/sh

options=$(getopt --options="hspc:" --longoptions="help,script,program,prefix" --name "$0" -- "$@")
if [[ $? -ne 0 ]]; then exit 10; fi
eval set -- "$options"

prefix='# '
banner='danii'\''s'

while true; do
	case "$1" in
		-h|--help)
			printf 'Insert help here.'
			exit
			;;
		-s|--script)
			prefix="# "
			shift
			;;
		-p|--program)
			prefix="// "
			shift
			;;
		-c|--prefix)
			prefix="$2"
			shift 2
			;;
		--)
			shift
			break
			;;
		*)
			printf 'Entered unreachable code'
			exit 255
			;;
	esac
done

hero=$(figlet -f script "$banner" | grep -Ev '^ *$')
spaces=$(($(wc -L <<< "$hero") - ($(tail -n 1 <<< "$hero" | wc -m) - 2)))
spaces=$(printf ' %.0s' {0..$spaces})
hero=$(awk -v prefix="$prefix" '$0=prefix$0' <<< "$hero")
printf '%s%s%s' "$hero" "$spaces" "$1"