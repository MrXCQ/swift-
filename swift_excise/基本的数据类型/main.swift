//
//  main.swift
//  基本的数据类型
//
//  Created by zc on 2018/6/21.
//

import Foundation

/**
 *  基本的数据类型
 *  OC：int、double、long、short、singed、unsigned
 *  各种类型的数据的取值范围在不同位的编译器下取值范围不同
 *  Swift 注意关键词大写
 */

//整型
var  intValue:Int = 10
// 浮点型
var intV1:Double = 10.10 // 表示64位浮点数
var intV2:Float = 8.9    // 表示32位浮点数

//如果按照长度划分 Swift 中的长短比OC 更为精确
var intV3:Int8  = 6
var intV4:Int16 = 8
var intV5:Int32 = 16
var intV6:Int64 = 32

// 有符号和无符号  默认是有符号的  UInt8、UInt16、UInt32、UInt64
var uintV1:UInt = 10
// 注意 无符号的数比有符号的取值范围更大 因为符号位也用来存值
// swfit 是类型安全的语言 如果取值错误会直接报错 而OC 不会

/**
 *  取值不对
 *  OC unsigned int Value = -10 不会报错
 *  swift  var  int Value：UInt = UInt.max + 1 不会报错
 *  溢出：
 *  OC Int Value = INT_MAX + 1 不会报错
 *  Swift var intValue : UInt =  UInt.max +1 会报错
 *
 */

/**
 *  数据类型的相互赋值 （隐式 类型转换）
 *  OC 可以
 *  Int intValue  = 10 ; double doubleValue = intValue
 *  Swift  不可以
 */



