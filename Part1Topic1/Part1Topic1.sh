#! /bin/bash
# Part 1 Topic 1
# Part a
ListOfFile () {
val="Program Part 1 Topic 1"
file=part1topic1.html
filetype=
cat <<EOF1 > $file
<html> 
<head>
<title>Program Part 1 Topic 1</title>
</head>
<body>
<h1>$val</h1>
EOF1
echo '<table border="1">' >> $file
echo '<th>File Name</th>' >> $file
echo '<th>Extension</th>' >> $file
echo '<th>Size</th>' >> $file
echo '<th>Location of the file</th>' >> $file
sudo find / -type f \( -iname \*.mp3 -o -iname \*.mp4 -o -iname \*.mkv -o -iname \*.wav \)  -printf "%f  " -exec ls -l --block-size=K {} \; | awk '{split($1,array,".")} { print "<tr>" "<td>" array[1] "</td>" "<td>"array[2] "</td>" "<td>"$6 "</td>" "<td>"$10"</td>""</tr>"}' >> $file
echo '</table>' >> $file
cat <<EOF2 >> $file
</body>
</html>
EOF2
	echo "List of media files"
	sudo find / -type f \( -iname \*.mp3 -o -iname \*.mp4 -o -iname \*.mkv -o -iname \*.wav \) -printf "%f  " -exec ls -l --block-size=K {} \; | awk '{split($1,array,".")} { print array[1] "\t" array[2] "\t" $6 "\t" $10}'| column -t
}

# Part b
ListSortByAlpha () {
	echo "Sort by apha"
	sudo find / -type f \( -iname \*.mp3 -o -iname \*.mp4 -o -iname \*.mkv -o -iname \*.wav \) -printf "%f  " -exec ls -l --block-size=K {} \; | awk '{split($1,array,".")} { print array[1] "\t" array[2] "\t" $6 "\t" $10}'| sort -k1,1 | column -t 
}

ListSortByExtension () {
	echo "Sort by extension"
	sudo find / -type f \( -iname \*.mp3 -o -iname \*.mp4 -o -iname \*.mkv -o -iname \*.wav \) -printf "%f  " -exec ls -l --block-size=K {} \; | awk '{split($1,array,".")} { print array[1] "\t" array[2] "\t" $6 "\t" $10}' | sort -k2,2 | column -t 
}

ListSortBySize () {
	echo "Sort by size"
	sudo find / -type f \( -iname \*.mp3 -o -iname \*.mp4 -o -iname \*.mkv -o -iname \*.wav \) -printf "%f  " -exec ls -l --block-size=K {} \; | awk '{split($1,array,".")} { print array[1] "\t" array[2] "\t" $6 "\t" $10}'| sort -k3,3n | column -t 
}

# Part c
ListOfDuplicate () {
	echo  "highlight if there are duplicate files"
	sudo find / -type f \( -iname \*.mp3 -o -iname \*.mp4 -o -iname \*.mkv -o -iname \*.wav \) -printf "%f  " -exec ls -l --block-size=K {} \; | awk '{split($1,array,"."); if (x[$1]) { x_count[$1]++;  print "\033[1;31m" array[1] "\t" array[2] "\t" $6 "\t" $10 "\033[0m "; if (x_count[$1] == 1) { print x[$1] } } x[$1] = "\033[1;31m" array[1] "\t" array[2] "\t" $6 "\t" $10 "\033[0m "}'| column -t | sort -k1,1
}

MENU="
Program Part 1 Topic 1
1) Part a
2) Part b Sort by Apha
3) Part b Sort by Size
4) Part b Sort by Extension
5) Part c
6) Quit
"
MenuFunction () {
	while true; do
  clear
  echo "$MENU"
  echo -n "Please make your choice: "
  read INPUT # Read user input and assign it to variable INPUT
 
  case $INPUT in
    1)
    ListOfFile
    echo press ENTER to continue
    read
    ;;
    2)
    ListSortByAlpha
    echo press ENTER to continue
    read
    ;;
    3)
    ListSortBySize
    echo press ENTER to continue
    read
    ;;
    4)
    ListSortByExtension
    echo press ENTER to continue
    read
    ;;
    5)
    ListOfDuplicate
    echo press ENTER to continue
    read
    ;;
    6|q|Q) # If user presses 3, q or Q we terminate
    exit 0
    ;;
    *) # All other user input results in an usage message
    clear
    echo Please choose alternatves 1,2,3,4,5 or 6
    sleep 1
    ;;
  esac
 
done
}

MenuFunction
