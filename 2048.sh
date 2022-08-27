select option in NEWGAME INSTRUCTIONS HELP RESUME HIGHSCORES  EXIT
do
clear 
case $option in
	NEWGAME)echo -e "select mode \n1)Practice\n2)Competition\n3)Time Trial Mode"
		read mode
		case $mode in 
		1)
		 echo "enter board size"
		 read board
		echo -e "select target \n1)default(2048)\n2)set new target"
	         read opt
			case $opt in 
			1)echo "Game is started by default target"
		    		bash bash2048.sh -b $board;;
			2)read -p "enter your target:" target
				bash bash2048.sh -t $target -b $board;;
			esac ;;

		2)echo -e "select level\n1)Difficult\n2)Moderate\n3)Easy" #lesser the board and more target higher is the toughness
		  read level
			    case $level in
			    1)((target=4096))
					((board=4))
			    		bash bash2048.sh -c 1 -t $target -b $board ;;
			    2)((target=2048))
				     ((board=5))
					bash bash2048.sh -c 2 -t $target -b $board;;
			    3) ((target=2048))
			          ((board=6))
				bash bash2048.sh -c 3 -t $target -b $board;;
			    *)echo "ENTER CORRECT OPTION";;		  
			   esac;;
		  3)((target=2048))
		    ((board=4))
		   bash bash2048.sh -c 4 -t $target -b $board ;;
		   
		 *)echo "ENTER CORRECT OPTION";;
	          esac;;
	INSTRUCTIONS)
    echo -e "HOW TO PLAY:"
    echo
    echo " _______________________________________|   2048    |_____________________________________"
    echo "|                                                 		       		          |"
    echo "| Use the w/a/s/d keys or h/j/k/l keys or arrow keys to move tiles and CTRL+C to quit.    |"
    echo "|_________________________________________________________________________________________|"
    echo " "
    echo -e "When two tiles with the same number touch, they merge into one!\nTest your mind and skills. Let see how quick you can play 2048 game.\nAll you need to do is add the two tiles with the same number.\nThe two tiles with the same number will merge or add up.\nThink and strategize to get the highest score.\nSo join the numbers and get to the target(default 2048) tile!";;
   HIGHSCORES) clear
	    echo -e "select level\n1)Difficult\n2)Moderate\n3)Easy\n4)Timer mode\n" 
		  read level
		  echo -e "--------------------------TOP FIVE HIGHSCORES------------------------------\n"
		  echo "position score"
			    case $level in
			    1)sort -nro Difficult.txt Difficult.txt;cat -n Difficult.txt|head -n 5;;
			    2)sort -nro Moderate.txt Moderate.txt; cat -n Moderate.txt|head -n 5;;
			    3) sort -nro Easy.txt Easy.txt;cat -n Easy.txt|head -n 5;;
			    4)sort -nro Timer.txt Timer.txt;cat -n Timer.txt|head -n 5;;
			    *)echo "ENTER CORRECT OPTION";;
			   esac;;
	          
	HELP) echo -e "DIRECTION OF PUSH:\n 1) w,k = up \n 2) s,j = down \n 3) a,h = left \n 4) l,d = right\n"
		echo -e "^c = To quit the game at any time and the game can be saved and played again by resuming the game"
		echo -e " About modes:\n"
		echo -e " Two types of modes are: 1)PRACTICE mode 2)COMPETITION mode\n "
		echo -e "  1)PRACTICE mode : Player is allowed to choose any board size and target of the game\n"
		echo -e "  2)COMPETITION mode : Player can play in any of easy,moderate,difficult levels of the game\n";;
	RESUME) bash bash2048.sh -r;;	
	
	EXIT)exit 0;;
	   *)echo "ENTER CORRECT OPTION";;
esac
echo -e "\n\nPRESS ENTER TO GO TO MENU\n\n"
  done		
