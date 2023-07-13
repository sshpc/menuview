# shell 菜单渲染
## 一、介绍


* 使用函数传参形式 遍历参数 输出终端选项
* 已连续数字形式接受用户输入并执行对应函数
* 有需要添加其他自定义指令选项可以直接在if elif 后继续添加
* 再也不需要头疼 echo printf.. 打印格式 堆case in 1) 2) esac ...

## 二、使用

1. 引入menu函数
> 一般把函数复制进自己的脚本即可
2. 定义自定义的数组 格式固定
```sh
options=("选项1" options1 "选项2" options2 "选项3" options3 )
```
>选项1 终端显示

>options1  自定义的函数名

3. 执行函数调用 并传参
```sh
menu "${options[@]}"
```

其他用法见 example.sh
也可以参考 [https://github.com/sshpc/initsh](https://github.com/sshpc/initsh)


## 三、示例

```sh
>~~~~~~~~~~~~~~ xxx ~~~~~~~~~~~~<  版本:v0.1.0

当前菜单: 主页 

1: 选项1           2: 选项2

3: 选项3           4: 选项4

q: 退出    0: 返回主页

请输入命令数字: 
```
