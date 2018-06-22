//
//  main.swift
//  运算符
//
//  Created by zc on 2018/6/22.
//

import Foundation

print("运算符 Hello, World!")

// 算数运算符 除了取模 其余和OC 一样包括优先级

//  swift 是安全严格的语言，会在编译的时候检查是否溢出，但是只会检查字面量而不会检查变量，所以在swift中一定要注意隐式溢出
/**
 *  var num1:UInt8 = 255 +1 可以检测
 *  var num1:UInt8 = 255    无法检测
 *  var num2:UInt8 = 250
 *  println（num1 + num2）
 *  此问题可以通过：http://www.yiibai.com/swift/overflow_operators.html 解决
 */

//取模
/**
 *  OC 只对整数取模
 *  NSLog(@"%tu",10%3)
 *  swift 2.0 支持小数取模 之后不支持了
 */

// print(10 % 3.5) 报错

// 赋值运算符 ：  自增、自减  += ，-=, /=, *= ,%=
// 关系运算符 ：  得出的是Bool 值 和OC 一样
var result1:Bool = 250 > 100
var result2 = 250 > 100 ? 250 : 100 //三目运算符
print(result1,result2)


//逻辑运算符：基本用法和OC一样，唯一要注意的是Swift中的逻辑运算符只能操作Bool 类型的数据 ，而OC 可以操作整型 （非0即1） ！，&& ，||


/**
 *  区间
 *  闭区间 ：包含区间内所有的值 a...b 例如 1...5

 *  半闭区间 ： 包含头不包含位 a..<b  例如 1..<5
 *  注意： swift 刚出来的写法是a..b
    区间只能用于整数，写小数会有问题 ，遍历
 */

for i in 1...5
{
    print(i)
}

for i in 1..<5
{
    print(i)
}














