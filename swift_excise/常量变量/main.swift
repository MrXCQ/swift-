//
//  main.swift
//  常量变量
//
//  Created by zc on 2018/6/21.
//  Copyright © 2018年 Chomp.IMpBear. All rights reserved.
//

import Foundation

print("Hello, World!")


/**
 *  使用let 声明常量 使用var 声明变量
 */

let num1 = 10
var num2 = 10
num2 = 11
//  num1 = 12 let 声明常量不可修改 会报错

print("num1 --- \(num1) ,num2 --- \(num2)")

/**
 *  定义的同时初始化
 *  在swift中如果定义的同时初始化一个变量，可以不用写数据类型  编译器会根据初始化的值自动推断出变量的类型
   （其他语言是没有类型推断的）
 *  以后如果在开发中在定义的同时初始化就没有必要指定数据类型，除非需要明确数据类型的长度或者定义时不初始化才需要指定数据类型
 */

var num3:Int = 20
var num4 = 20
/*** 你可以用任何喜欢的字符作为常量和变量名 包括Unicode 字符
* 常量与变量名不能同时包含数字符号、箭头，保留的或者非法的Unicode 码位连线制表符。也不能使用数组开头但是可以在常量和变量其他的地方包含数字
* 错误： var 3x = 10  , var x+-3 = 10
*
*/

var 🐤 = 11
var 点读 = 12

/**
 *  常量
 *  OC：  const int num = 100
 *  swift：  let num  = 100
 错误
 *  let num : Int
 *  swift 中的常量必须要定义时初始化  OC 不可以初始化，否则会报错
 *  常量的用途：某些值以后不需要改变 例如个人的身份证
 */
let num6 = 102020



