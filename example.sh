#!/bin/bash
export LANG=en_US.UTF-8
#全局变量初始化
version='0.3'

source menu.sh

options1() {
  options1-1() {
    echo
    echo "this is options1-1"
    echo
  }
  menuname='主页/选项1'
  options=("选项1-1" options1-1 "选项1-2" options1-2 "选项1-3" options1-3)

  menu "${options[@]}"
}

options2-1() {
  echo
  echo "this is options2-1"
  echo
}

options2() {
  menuname='主页/选项2'
  options=("选项2-1" options2-1 "选项2-2" options2-2)

  menu "${options[@]}"
}

options3() {
  echo
  echo "this is options3"
  echo

}

main() {
  #定义数组
  options=("选项1" options1 "选项2" options2 "选项3" options3)

  #调用函数
  menu "${options[@]}"

}
sinit
main
