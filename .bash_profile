WARNING="\e[31m[!]"
HINT="\e[33m[*]"
BOLD="\e[1m"

# open my programming dir
hack() {
	cd /d/___programming
	start .
}

# setup codeforces round environment in my programming dir
hackcf() {
	if [ -z "$1" ] || [ -z "$2" ]; then
		echo -e "$WARNING All arguments must be satisfied"
		echo -e "$HINT Usage: hackcf [round-number] [div-id]"
	else
		cf.sh /d/___programming/algorithms-and-data-structures/codeforces "$1" "$2"
	fi
}

# setup oi task environment in my programming dir
hackoi() {
	if [ -z "$1" ]; then
		echo -e "$WARNING All arguments must be satisfied"
		echo -e "$HINT Usage: hackoi [task-name]"
	else
		oi.sh /d/___programming/algorithms-and-data-structures/olympiad_in_informatics "$1"
	fi
}

# cpp competetive-programming template in console directory
hackcpp() {
	if [ -z "$1" ]; then
		echo -e "$WARNING All arguments must be satisfied"
		echo -e "$HINT Usage: hackcpp [task-name]"
	else
		oi.sh $(pwd) "$1"
	fi
}

# cpp competetive-programming template in console directory for codeforces practice
hackcfp() {
	if [ -z "$1" ] || [ -z "$2" ]; then
		echo -e "$WARNING All arguments must be satisfied"
		echo -e "$HINT Usage: hackcfp [task-number] [diff-id]"
		echo -e "$HINT Example: hackcfp 158 b"
	else
		task_number=$1
		task_diff=$2
		name_max_len=6
		num_len=${#task_number}
		leading_zeros_len=$((name_max_len - num_len))
		task_name=""
		while [ $leading_zeros_len -gt 0 ]; do
			task_name+="0"
			leading_zeros_len=$((leading_zeros_len - 1))
		done
		task_name+="${task_number}_${task_diff^}"
		oi.sh $(pwd) "$task_name"
		echo -e "$HINT [Fast compile]"
		echo -e "$BOLD g++ $task_name.cpp -o sol; ./sol < in"
	fi
}

function compile_and_run_tests_cpp() {
	file=$1
	[ -z $2 ] && input="in" || input=$2
	path=$(pwd)
	exe_name="sol"
	g++ -o $exe_name "$path/$file"
	"$path/$exe_name" <"$path/$input" || echo -e "$WARNING Couldn't compile and run cpp file. Did you create an input file?"
}

runcpp() {
	[ -z "$1" ] && (echo -e "$WARNING Usage: runcpp [file-name] [input-file(optional)]") || compile_and_run_tests_cpp $1 $2
}
