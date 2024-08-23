#!/bin/bash
export LANG=en_US.UTF-8

menu() {
        options=("$@")
        num_options=${#options[@]}
        # 计算数组中的字符最大长度
        max_len=0
        for ((i = 0; i < num_options; i++)); do
            # 获取当前字符串的长度
            str_len=${#options[i]}

            # 更新最大长度
            if ((str_len > max_len)); then
                max_len=$str_len
            fi
        done
        # 渲染菜单
        for ((i = 0; i < num_options; i += 4)); do
            printf "%s%*s  " "$((i / 2 + 1)): ${options[i]}" "$((max_len - ${#options[i]}))"
            if [[ "${options[i + 2]}" != "" ]]; then printf "$((i / 2 + 2)): ${options[i + 2]}"; fi
            echo
            echo
        done
        echo
        printf '\033[0;31;36m%b\033[0m' "q: 退出  "
        if [[ "$number" != "" ]]; then printf '\033[0;31;36m%b\033[0m' "b: 返回  0: 首页"; fi
        echo
        echo
        # 获取用户输入
        read -ep "请输入命令号: " number
        if [[ $number -ge 1 && $number -le $((num_options / 2)) ]]; then
            #找到函数名索引
            action_index=$((2 * (number - 1) + 1))
            #函数名赋值
            parentfun=${options[action_index]}
            #函数执行
            ${options[action_index]}
            #执行完后自动返回
            waitinput
            ${FUNCNAME[3]}
        elif [[ $number == 0 ]]; then
            main
        elif [[ $number == 'b' ]]; then
            ${FUNCNAME[3]}
        elif [[ $number == 'q' ]]; then
            echo
            exit
        else
            echo
            _red '输入有误  回车返回首页'
            waitinput
            main
        fi
}

#定义数组
options=("选择options1" options1 "选择options2" options2 "选择options3" options3)

#调用函数
menu "${options[@]}"
