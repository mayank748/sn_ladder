declare -A arr[10,10]

function assign()
{
	local k=100
	for ((i=9;i>=0;i--))
	do
		temp=$(($i % 2))
		if [ $temp = "1" ]
		then
		for((j=0;j<10;j++))
		do
			arr[$i,$j]=$k
			k=$(($k-1))
		done
		else
		for((j=9;j>=0;j--))
		do
		arr[$i,$j]=$k
		k=$(($k-1))
		done
		fi
	done
}

function print()
{
	point=$1
	clear
	echo "========================="\"Snake ladder gmae"\"==========================="
	for ((i=9;i>=0;i--))
	do
	echo "----------------------------------------------------------------------"
		for((j=0;j<10;j++))
		do
		if [ $j -eq 0 ]
		then
			echo -e "|\c"
		fi
		if [ $i -eq 9 -a $j -eq 0 ]
		then
			echo -e "\c"
		else
			echo -e " \c"
		fi
		if [ "${arr[$i,$j]}" = "$point" ]
		then
			echo -e "[_]\c"
		elif [ "${arr[$i,$j]}" = "4" -o "${arr[$i,$j]}" = "12" -o "${arr[$i,$j]}" = "14" -o "${arr[$i,$j]}" = "22" -o "${arr[$i,$j]}" = "41" -o "${arr[$i,$j]}" = "54" ]
		then
			echo -e " # \c"
		elif [ "${arr[$i,$j]}" = "28" -o "${arr[$i,$j]}" = "37" -o "${arr[$i,$j]}" = "94" -o "${arr[$i,$j]}" = "96" -o "${arr[$i,$j]}" = "75" -o "${arr[$i,$j]}" = "47" ]
		then
			echo -e "&  \c"
		elif [ "${arr[$i,$j]}" = "56" -o "${arr[$i,$j]}" = "50" -o "${arr[$i,$j]}" = "58" -o "${arr[$i,$j]}" = "79" -o "${arr[$i,$j]}" = "88" ]
		then
			echo -e "@  \c"
		elif [ "${arr[$i,$j]}" = "71" -o "${arr[$i,$j]}" = "42" -o "${arr[$i,$j]}" = "32" -o "${arr[$i,$j]}" = "16" -o "${arr[$i,$j]}" = "5" -o "${arr[$i,$j]}" = "10" ]
		then
			echo -e "!! \c"
		else
			echo -e "${arr[$i,$j]} \c"
		fi
		if [ $i -gt 0 -a $j -lt 9 ]
		then
			echo -e " | \c"
		elif [ $i -eq 0 -a $j -eq 4 ]
		then
			echo -e " |\c"
		else
			echo -e "  | \c"
		fi
		done
		echo " "
	done
	echo "----------------------------------------------------------------------"
	echo "The ladder by #, Snake by &, incremnt by @ and decrement by !!."
}


function roll_dice()
{
	echo "Dice value: "$dice
	echo "Press (r or R) roll the dice."
	read input
	if [ "$input" = "r" -o "$input" = "R" ]
	then
 		dice=$(($RANDOM%6+1))
	return $dice
	else
		echo "Enter the correct choice"
		roll_dice
	fi
}

function update_position()
{
		up=$1
		updated_position=$(($up + $dice))
	return $updated_position
}


function Player_Position()
{
		position=$1
		echo "Player is at: "$position
}


function snake_ladder_condition()
{
		Pl_pos=$1
		case $Pl_pos in
			4)	echo "Player got ladder"
			 return 56
				;;

			12)	echo "Player got ladder"
			 return 50
				;;

			14)	echo "Player got ladder"
			 return 55
				;;

			22)	echo "Player got ladder"
			 return 58
				;;

			28)	echo "Player got Snake"
			 return 10
				;;

			37)	echo "Player got Snake"
			 return 3
				;;

			41)	echo "Player got ladder"
			 return 79
				;;

			54)	echo "Player got ladder"
			 return 88
				;;

			75)	echo "Player got Snake"
			 return 32
				;;

			94)	echo "Player got Snake"
			 return 71
				;;

			96)	echo "Player got Snake"
			 return 42
				;;

			*)	return 0;;

				esac

}


function check()
{
	pos=$1
	if [ "$pos" = "0" ]
	then
		return $position
	else
		return $pos
	fi
}


function win_condition()
{
	local win=$1
	if [ $win -eq 100 ]
	then
		echo "Player Won"
		exit
	else
		return $win
	fi
}


function check_if_gt_100()
{
	uppos=$1
	if [ $uppos -gt 100 ]
	then
			uppos=$(($uppos-$dice))
		return $uppos
	else
		return $uppos
	fi
}


assign
up=0

while true 
do
print $winner
roll_dice
position=$?
update_position $winner
upda=$?
check_if_gt_100 $upda
gt=$?
print $gt
Player_Position $gt
snake_ladder_condition $upda
che_k=$?
check $che_k
result=$?
win_condition $result
winner=$?
Player_Position $winner
done
