//
//  main.swift
//  类型转换
//
//  Created by zc on 2018/6/21.
//

import Foundation

/**
 *  swift  不允许饮食类型转换 但可以使用显示类型转换  强制类型转换
 *  OC ： int  intValue  = 10;  double doubleValue = （double）intValue ;
 *
 */

// swift
var intValue:Int = 10
var douValue:Double

douValue  = Double(intValue)
//注意: Double() 并不会修改intValue 的值而是通过intValue 的值生成一个临时的值赋给doublevalue

print("int --- \(intValue) double --- \(douValue)")
