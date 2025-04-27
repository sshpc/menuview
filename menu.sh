#菜单名称(默认主页)
menuname='主页'
# 颜色定义
_red() {
    printf '\033[0;31;31m%b\033[0m' "$1"
    echo
}
_green() {
    printf '\033[0;31;32m%b\033[0m' "$1"
    echo
}
_yellow() {
    printf '\033[0;31;33m%b\033[0m' "$1"
    echo
}
_blue() {
    printf '\033[0;31;36m%b\033[0m' "$1"
    echo
}

# 等待输入
waitinput() {
    echo
    read -n1 -r -p "按任意键继续...(退出 Ctrl+C)"
}


menu() {
    clear
    _green '>~~~~~~~~~~~~~~菜单列表~~~~~~~~~~~~~~<'
    echo
    _yellow "当前菜单: $menuname "
    echo

    local options=("$@")
    local num_options=${#options[@]}
    local max_len=0

    for ((i = 0; i < num_options; i += 2)); do
        local str_len=${#options[i]}
        ((str_len > max_len)) && max_len=$str_len
    done

    for ((i = 0; i < num_options; i += 4)); do
        printf "%s%*s  " "$((i / 2 + 1)): ${options[i]}" "$((max_len - ${#options[i]}))"
        [[ -n "${options[i + 2]}" ]] && printf "$((i / 2 + 2)): ${options[i + 2]}"
        echo -e "\n"
    done

    _blue "q: 退出  b: 返回  0: 首页"
    echo
    read -ep "请输入命令号: " number

    case "$number" in
    [1-$((num_options / 2))])
        local action_index=$((2 * (number - 1) + 1))
        parentfun=${options[action_index]}
        ${options[action_index]}
        waitinput
        main
        ;;
    0) main ;;
    b) ${FUNCNAME[3]} ;;
    q) exit ;;
    *)
        _red '输入错误'
        waitinput
        main
        ;;
    esac
}
