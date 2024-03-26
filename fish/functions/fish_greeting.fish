function fish_greeting
	#test (cat /sys/class/power_supply/BAT0/status) = 'Charging'
    echo
    echo -e "\033[0;31m---{ Välkommen till Johannes dator }---\033[0m"
	echo -e "\033[0;31m       Datumet är $(date '+%F') \033[0m"
    echo -e "\033[0;31m       Klockan är $(date '+%T') \033[0m"
    echo -e "\033[0;31m       Batterinivå $(cat /sys/class/power_supply/BAT0/capacity)%\033[0m"
    echo
end

