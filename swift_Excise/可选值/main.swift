//
//  main.swift
//  可选值
//
//  Created by zc on 2018/6/21.
//

import Foundation

/**
 *  可选值 optionals  有两种状态
 *  有值和没有值 没有值就是nil
 *
 */

// 有值
var optionValue: Int? = 9
// 没有值
var option1: Int?
var option2: Int? = nil

// 可选值可以用if 语句 来进行判断
var option3: Int?
if option3 != nil{
    print(option3!)
}else {
    print(optionValue!)
}


/**
 *  提取可选类型的值  （强制解析）
 *  会将optValue 中的整型值强制拿出来赋值给result 换言之就是告诉编译器optValue 一定有值 因为可选类型有两种状态 可以告诉编译器此有没有值
 *  如果强制解析optValue 但是是没有值的会引发一个运行时的错误
 */

var optValue4: Int? = 10
var r1: Int = optValue4!
print(r1)

/***
*  可选绑定
*  为了安全的解析可选类型的值  一般情况下使用可选绑定
*  如果optValue  没有值就不会做任何操作 如果optValue 有值会返回并将optValue 的值赋值给result 执行大括号中的内容
**/

var optValue5: Int? = 11
if let res = optValue5{
    print(res)
}









