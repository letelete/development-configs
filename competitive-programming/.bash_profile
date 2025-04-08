WARNING="\e[31m[!]"
HINT="\e[33m[*]"
BOLD="\e[1m"

commands() {
    echo -e "$BOLD === Available commands ==="
    echo -e "$HINT hack: cd to the programming directory"
    echo -e "$HINT hackcf: setup codeforces round environment in the current directory"
    echo -e "$HINT hackcfp: codeforces practice cpp file in the console directory"
    echo -e "$HINT hackcpp: cpp file with the competetive-programming template in the current directory"
    echo -e "$HINT runcpp: compile and run cpp file with; satisfy input from external file"
}

hack() {
    cd /d/___programming || "$WARNING Couldn't find the programming directory"
}

hackcf() {
    cf.sh $1 $2 || echo -e "$WARNING Couldn't hack codeforces round"
}

hackcpp() {
    cp_template.sh "$1" || echo -e "$WARNING Couldn't hack cpp"
}

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
