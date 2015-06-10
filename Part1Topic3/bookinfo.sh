#! /bin/bash
# Part 1 Topic 3
# Part a
file=book
fileprint=book_print
EnterBook () {
    echo "Please enter all information: "
    echo "Books: "
    read TIT
    echo "Author(s): "
    read AU
    echo "Publisher: "
    read PUB
    echo "Year of publication: "
    read YEA
    # Part b
    echo $TIT "|" $AU "|" $PUB  "|" $YEA
    echo $TIT "|" $AU "|" $PUB  "|" $YEA >> "$file"
}

# Part c
PrintAllBook () {
	header="\n %-50s %20s %20s %11s\n"
	printf "$header" "Book Title" "Author(s)" "Publisher" "Year" > "$fileprint"
	printf "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" >> "$fileprint"
    while IFS='|' read -r title author publisher year
    do
       	printf "$header" "$title" "$author" "$publisher" "$year" >> "$fileprint"
    done < "$file"
}

if [[ "$1" == "print" ]]; then
	PrintAllBook
	echo "Print all book to book_print"
fi

while getopts ":f:i:e" opt; do
  case $opt in
    e)
    	echo "-e was triggered" >&2
    	EnterBook
    ;;

    f)
    	echo "-f was triggered, Find String: $OPTARG" >&2
    	searchString="$OPTARG"
    	header="\n %-50s %20s %20s %11s\n"
		printf "$header" "Book Title" "Author(s)" "Publisher" "Year"
		printf "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" 
    	while IFS='|' read -r title author publisher year
    	do
       		thisString="$title $author $publisher $year" 
    		if `echo ${thisString} | grep "${searchString}" 1>/dev/null 2>&1`
			then
  				printf "$header" "$title" "$author" "$publisher" "$year"
			fi
    	done < "$file"

    	if [[ "$3" == "print" ]]; then
			header="\n %-50s %20s %20s %11s\n"
			printf "$header" "Book Title" "Author(s)" "Publisher" "Year" > "$fileprint"
			printf "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" >> "$fileprint"
    		while IFS='|' read -r title author publisher year
    		do
       			thisString="$title $author $publisher $year" 
    			if `echo ${thisString} | grep "${searchString}" 1>/dev/null 2>&1`
				then
  					printf "$header" "$title" "$author" "$publisher" "$year" >> "$fileprint"
				fi
    		done < "$file"
			echo "Print found book to book_print"
		fi
	;;

    i)
    	echo "-i was triggered, Find String: $OPTARG" >&2
    	searchString="$OPTARG"
    	header="\n %-50s %20s %20s %11s\n"
		printf "$header" "Book Title" "Author(s)" "Publisher" "Year"
		printf "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" 
    	while IFS='|' read -r title author publisher year
    	do
       		thisString="$title $author $publisher $year" 
    		if `echo ${thisString} | grep -i "${searchString}" 1>/dev/null 2>&1`
			then
  				printf "$header" "$title" "$author" "$publisher" "$year"
			fi
    	done < "$file"

    	if [[ "$3" == "print" ]]; then
			header="\n %-50s %20s %20s %11s\n"
			printf "$header" "Book Title" "Author(s)" "Publisher" "Year" > "$fileprint"
			printf "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" >> "$fileprint"
    		while IFS='|' read -r title author publisher year
    		do
       			thisString="$title $author $publisher $year" 
    			if `echo ${thisString} | grep -i "${searchString}" 1>/dev/null 2>&1`
				then
  					printf "$header" "$title" "$author" "$publisher" "$year" >> "$fileprint"
				fi
    		done < "$file"
			echo "Print found book to book_print"
		fi
	;;

    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
    ;;

    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done