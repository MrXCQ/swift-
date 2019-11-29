//
//  main.swift
//  字典使用
//
//  Created by zc on 2018/7/12.
//

import Foundation

/**
 *  字典定义 ： 键值对
 *  key 一定是要可以hash 的 string 、Int、Double、Bool  value 没有要求
 */

var dict = ["name":"sss","age":25] as Any
print(dict)

var dict1:Dictionary<String,AnyObject> = ["name":"cnm" as AnyObject,"age":24 as AnyObject]

print(dict1["name"] as Any)

var dict2:[String:AnyObject] = ["name":"cnm11" as AnyObject,"age":23 as AnyObject]
print(dict2)

// 字典的快速定义
let dic:[String:Any] = ["name":"zhang","age":13]
print(dic)

//数组字典
let arrDic:[[String:Any]] = [["name":"xcq","age":12],["name":"xcq2","age":12]]
print(arrDic)

// 可变字典的增删改查
var dict3:[String:Any] = ["name":"xcq","age":12]
print(dict3)

// 如果存在key为修改，不存在则为添加
dict3["height"] = 172.3
print(dict3)

// 修改键值对
dict3["name"] = "HaHa"
print(dict3)

// 删除键值对
// 字典是通过key来定位的，所有的key必须是可以 hash/哈希的，（MD5 为一种哈希，哈希就是将字符串变为唯一的整数，便于查找能够提高字典遍历的速度）

// 字典遍历

// 写法1
for dic in dict3{
    print("key  ---- \(dic.key), value --- \(dic.value)")
}

// 写法2
for (key,value) in dict3{
    print("key ----- \(key),value ---- \(value)")
}


//MARK:字典合并
var dic4 = ["name":"xcaa","age":24] as [String :Any]
let dic5 = ["teacher":"wang"]

for (key,value) in dic5{
    dic4[key] = value
}

print(dic4)



//MARK:集合字典
// 字典的定义和创建
var airports : Dictionary<String,String> = ["a":"22","b":"dddd"]
// 字典的增加和替换
var dt1 = ["name":"刘德华","age":55,"height":180] as [String : Any]
print("字典  ------ \(dt1)")


//字典的区间遍历
for dictA in ["name":"刘德华","age":55,"height":180] as [String : Any] {
    print(dictA)
}


//MARK: 编程测验题

//1、创建一个数组，增加十个元素，然后遍历按从小到大的顺序输出

var arr : Array = [12,4,3,5,7,8,88,9,10,15]

for i in arr.sorted(){
    print(i)
}

// 降序
let so2 = arr .sorted { (s1, s2) -> Bool in
    s1 > s2
}

print("降序  -----\(so2)")









