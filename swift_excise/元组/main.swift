//
//  main.swift
//  元组
//
//  Created by zc on 2018/6/21.
//

import Foundation


/**
 *  元组
 *  在其他语言中很早就有元组这个概念 但是对于OC 语言来说是一个新的概念
 *  将多个相同或者不同类型的值用一个小括号就是一个元组
 */

let person = ("IMpbear",24,171.0)

print("name -- \(person.0),age -- \(person.1),height --- \(person.2)")

/**
 *  元组其实和结构体很像 只是不需要定义类型，如果没有定义类型元组会是神马类型呢？
 *  元组其实是组合类型 括号内部可以写任意类型
 *
 */

let person1:(String,Int,Double) = ("Tom",22,178)

// 元组的其他定义方式  指明应用元组元素的名称
let person2 = (name:"Tuko",age:23,height:175.6)

print("name -- \(person2.0),age -- \(person2.1),height --- \(person2.2)")

/**
 *  元组的其他定义方式
 *  通过指定的名称提取元组对应的值 ，会将对应位置的值赋值给对应位置的名称
 *
 */

let  (name,age,height)  =  ("zc",22,171)

print(name,age,height)

/**
 *  如果不关心元祖中某一个值可以利用_ 通配符来忽略提取
 */

let (name1,age1,_) = ("hello",22,123.3)

print(name1,age1)

// 没有元组之前C和OC 是通过传入指针或者结构体的方式来返回多个值，而有了元组就可以实现一个函数返回多个值

/**** 元组的定义 ****/

// 一元元组  会将编译器优化为其实际元素的类型。
var t1 : (String) = ("字符串")
// 直接等同于  var t1 ：String =  "我是字符串"
// 可以缺省类型 var t1 = “我是字符串”
// PS ： 由于t1 实际类型为String 类型，因此访问t1.0 的访问会报错


//MARK:元组支持嵌套
var T_t :(String ,(String,Int)) = ("外层元组",("内层元组",66))

print(T_t.0,T_t.1.0)

//可以将元组的类型重定义为一个类型名
typealias yuanZuName = (first:String,second:String,third:String)

let name2:yuanZuName = ("1","2","3")


print("元组重定义  --- \(name2.first,name2.second,name2.third)")


//MARK: 元组的数据访问
// 当元素未命名时  采用自然顺序访问  序号从0 开始

var t2 = ("熊哥 ",23)
var y1 = t2.0
var y2 = t2.1

print("元组数据访问 name  -- \(y1),age --- \(y2)")

// 当元素命名时，可以使用命名访问数据，当然可以使用序号进行访问
var y3  = (name : "impbear",age : 24)
y1 = y3.name
y2 = y3.age

print("元组数据访问 name  -- \(y3.name),age --- \(y3.age)")


// 可以用多个变量同事进行访问
var (name3,age3) =  y3  // 同时获取name  age
var (name4,_) = y3      // 不需要时参数可以缺省

// 另外注意 元组类型为数值类型 因此元组的拷贝是值拷贝
var t5_copy = y3
y3.name = "dmxy"
print(t5_copy.name)



//MARK:关于数组的访问级别
/**
 *  元组的访问级别取决于他包含的元素，比如元组里的元素都是private 私有级别的，那该元组也是私有级别的
 *  遵循最小的原则，也就是说如果一个元祖中有两个元素 一个为private 另一个为public 那个该元组最小原则为private 私有
 *
 */

//MARK:元组数据的修改 值可以修改 数据类型无法修改，但是如果指定数据类型为Any 这种情况可以改变类型

var y4 = (name:"XCQ",age:24)

y4.age = 25
print("y4age --- \(y4.age)") //25

y4.age = 27
print("y4age --- \(y4.age)") //27

//y4.age = "sdf" 报错!
var y5 :(String,Any) = ("ddfd",2323)
y5.0 = "iddi"
y5.1 = "Any改变类型"

print("any0 --\(y5.0),any1 --\(y5.1)")

//MARK:元组与Array ，dictionary 组合嵌套

// 数组嵌套元组
var yzArray:[(Int,String)] = [(12,"1"),(13,"2"),(14,"3")]

print(yzArray[0].1)

// 字典嵌套元组
var yzDict:[String:(String,Int)] = ["xcq":("boy",24),"cy":("girl",24)]

print("字典嵌套元组 ---\(yzDict)")


//MARK:元组常见的使用场景
//非常适用于字典的遍历
var airports: [String:String] = ["YYZ": "toronto", "DUB": "Dublin"]

for (airCode,airName) in airports {
    print("code -- \(airCode),name  --- \(airName)")
}

//非常受用于数组Array 的遍历
var shoppingList = ["eggs","milk"]

for (sindex , svalue) in shoppingList.enumerated() {
    print("index  -- \(sindex),value --- \(svalue)")
}


// 适合函数返回可选元组，即可以返回nil
func userInfoFunc() ->(String,Int)? {
    return ("dd",22)
    //    return nil
}

// 函数返回也可以部分元素可选
func userInfoFunc2() ->(String?,Int){
    return (nil,22)
}

// 甚至可以用来给函数传递多元参数
// 定义一个函数 有Number 和 text 两个参数
func doSomething(number:Int,text:String){
    print("\(number) : \(text)")
}

// 正常调用方式
doSomething(number: 56, text: "477878")

//元祖调用方式
let testYz = (53, "ddd")

doSomething(number: testYz.0, text: testYz.1)

//MARK:高级示例

//模拟情绪数据
var emojis : [(type: String,strength: Int)] = [("happy",0),("sad",1),("cry",2),("amazing",3),("scared",4),("tender",5),("shy",6)]

// 遍历数据 情绪为happy 的时候 strnegth  + 1
for  (index,emoji) in emojis.enumerated() {
    
    if emoji.type == "happy"{
        emojis[index] = (type: emoji.type, strength : index + 1)
    }
}

print(emojis)


//高级用法

emojis = emojis.map {
    emo in
    if emo.type == "happy"{
        return (type: emo.type , strength : emo.strength + 1 )
    }
    else{
        return emo
    }
}

print(emojis)


emojis = emojis.map({ss in
    if ss.type == "happy"{
        return (type: ss.type , strength : ss.strength + 1 )

    }else{
        return ss
    }
})

//let numbers = [1,2,5,4,3,6,8,7]
//var sortNumbers = numbers.sorted(by: {$0 < $1})
//print("numbers -" + "\(sortNumbers)")


