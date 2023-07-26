#!/bin/bash
export LANG=en_US.UTF-8
#全局变量初始化
sinit() {
    version='0.1.0'
    #菜单名称(默认主页)
    menuname='主页'
}
_blue() {
    printf '\033[0;31;36m%b\033[0m' "$1"
    echo
}
_yellow() {
    printf '\033[0;31;33m%b\033[0m' "$1"
    echo
}
#菜单头部
menutop() {
    clear
    echo
    _blue ">~~~~~~~~~~~~~~ xxx ~~~~~~~~~~~~<  版本:v$version"
    echo
    _yellow "当前菜单: $menuname "
    echo
}
#菜单底部
menubottom() {
    echo
    printf '\033[0;31;36m%b\033[0m' "q: 退出  " ;if [[ "$number" != "" ]]; then printf '\033[0;31;36m%b\033[0m' "  0: 返回主页";fi
    echo
    echo
    read -ep "请输入命令数字: " number
}

menu(){
    menutop
    number="$1"
    options=("$@")
    num_options=${#options[@]}

# 计算数组中的字符最大长度 目的计算空格以便菜单项垂直对齐
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
    for ((i=0; i<num_options; i+=4)); do
      printf "%s%*s  " "$((i / 2 + 1)): ${options[i]}" $((max_len - ${#options[i]})) "" ;if [[ "${options[i+2]}" != "" ]]; then printf "$((i/2+2)): ${options[i+2]}";fi
      echo
      echo
    done
    menubottom
    # Handle the user's input
    if [[ $number -ge 1 && $number -le $((num_options/2)) ]]; then
      action_index=$((2*(number-1)+1))
      ${options[action_index]}
    elif [[ $number == 0 ]]; then
      main
    elif [[ $number == 'q' ]]; then
      exit
    else
      echo '输入有误'
    fi
}

options1(){
menuname='主页/选项1'
options=("选项11" options1 "选项12" options2 "选项13" options3 )

menu "${options[@]}"
}

options2(){
menuname='主页/选项2'
options=("选项21" options1 "选项22" options2 )

menu "${options[@]}"
}

options3(){
menuname='主页/选项3'
options=("选项31" options1 )

menu "${options[@]}"
}

options4(){
menuname='主页/选项4'
options=("选项41" options1 "选项42" options2 "选项43" options3)

menu "${options[@]}"
}

main(){
#定义数组
options=("选项1" options1 "选项2" options2 "选项3" options3 "选项4" options4)

#调用函数
menu "${options[@]}"

}
sinit
main
