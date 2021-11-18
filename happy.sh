text="What is the meaning of life?"

function printtext
{
        total=`echo $text | wc -c`

        printf "                                                                                        "
        for ((i=1; i<=$total; i++));
        do
                line="-b$i"
                car=`echo $text | cut $line`
                printf "\e[3$(( $RANDOM * 6 / 32767 + 1 ))m$car"
        done
}

function findanswer
{
        ANSWER=`curl -L https://www.dictionary.com/e/slang/42/ -k --silent | grep 42 | grep 'content="42' | \
        grep description | grep "name=" | grep -v "twitter" | cut -f3 -d'=' | awk '{print $1}' | cut -f2 -d'"'` ;
}

clear
echo ""
printtext
findanswer
echo ""
COLUMNS=$(tput cols)
title="Hello world!"
printf "%*s\n" $(((${#title}+$COLUMNS)/2)) "$ANSWER"
pause
