#!/bin/bash
export LANG=en_US.UTF-8

menu(){
    number="$1"
    options=("$@")
    num_options=${#options[@]}

    # 渲染菜单
    clear
    for ((i=0; i<num_options; i+=4)); do
      printf "$((i/2+1)): ${options[i]}        " ;if [[ "${options[i+2]}" != "" ]]; then printf "$((i/2+2)): ${options[i+2]}";fi
      echo
      echo
    done
    echo "q: 退出  "
    
    echo
    #获取用户输入
    read -ep "请输入命令数字: " number
    # Handle the user's input
    if [[ $number -ge 1 && $number -le $((num_options/2)) ]]; then
      action_index=$((2*(number-1)+1))
      ${options[action_index]}
    elif [[ $number -eq 'q' ]]; then
      exit
    else
      echo '输入有误'
    fi
}

#定义数组
options=("选择1" options1 "选择2" options2 "选择3" options3 "选择4" options4)

#调用函数
menu "${options[@]}"

