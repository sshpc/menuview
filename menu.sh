#!/bin/bash
export LANG=en_US.UTF-8

menu() {
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
  clear
  for ((i = 0; i < num_options; i += 4)); do
    printf "%s%*s  " "$((i / 2 + 1)): ${options[i]}" $((max_len - ${#options[i]})) ""
    if [[ "${options[i + 2]}" != "" ]]; then printf "$((i / 2 + 2)): ${options[i + 2]}"; fi
    echo
    echo
  done
  echo "q: 退出  "

  echo
  #获取用户输入
  read -ep "请输入命令数字: " number
  # Handle the user's input
  if [[ $number -ge 1 && $number -le $((num_options / 2)) ]]; then
    action_index=$((2 * (number - 1) + 1))
    ${options[action_index]}
  elif [[ $number -eq 'q' ]]; then
    exit
  else
    echo '输入有误'
  fi
}

#定义数组
options=("选择选择1erter" options1 "选择er选择grg2" options2 "选择g选择选择选择3" options3 "选择grge选择选择选择选择r4" options4)

#调用函数
menu "${options[@]}"
