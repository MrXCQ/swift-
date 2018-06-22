//
//  main.swift
//  数组的基本使用
//
//  Created by zc on 2018/6/22.
//

import Foundation

print("数组的基本使用Hello, World!")

//MARK:数组的基本定义
// FDB92E F67E8C B98CDD 70A1F6 92C428
// 有值数组
var arr0 = [1,2,3,4]
var arr1: Array = [1,2,3]
var arr2: Array<Int> = [1,2,3,4,5]
var arr3: [Int] = [1,3,4,5]

// 空数组
var arr4 = [Int]()
var arr5 = Array<Int>()
print("空数组  --- \(arr4,arr5)")

// 不可变数组
let arr6 : [Any] = []

// 可变数组
var arr7 : [String] = []

/**
 *  元素类型
 *  OC NSArray *arr = @[@1,@"sds",@1.1];
 *
 */

var arr8 = ["1",1,1.33] as [Any]

print(arr8.last!)


//如果想明确表示数组中存放不同类型的数据，可以使用any 关键字表示数组中可以存放不同类型的数据
var arr9: Array<Any> = [1,"ss","ss",1.55]
print(arr9,arr9[2])

//MARK:数组操作
// 获取数组长度 arr.count
// 判断是否为空 arr.isEmpty
// 下标检索 arr[3]

// 追加元素
// OC : [mutArr addObject:@"aa"];
var arr10 = [1,2,3,4]

arr10 .append(5)
print(arr10)

var arr11 = [2,4,5]
arr11 += [4]
print(arr11)

//FIXME:有点意思
arr11 += arr11[0...3] // 借助自身的数组元素进行追加 arr11 append arr[0] ~ arr[3]

print(arr11)

/**
 *  数组插入
 *  OC [arr insertObject:@"4" atIndex:0]
 *
 */

var arr12 = [1,2,3,4]
arr12 .insert(8, at: 2)
print(arr12)

/**
 *  数组元素更新
 *  OC：arr[1] = @"new"
 *
 */
arr12[2] = 55
print(arr12)











