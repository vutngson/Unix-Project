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
    printf "%0s %60s %20s %10s\n" "Book title" "Author(s)" "Publisher" "Year"
    while IFS='|' read -r title author publisher year
    do
    printf "%0s %60s %20s %10s\n" "$title" "$author" "$publisher" "$year"
    done < "$file"
}

#EnterBook
PrintAllBook