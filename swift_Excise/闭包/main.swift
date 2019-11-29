//
//  main.swift
//  闭包
//
//  Created by zc on 2018/7/18.
//

import Foundation

print("Hello, World!")

/***
 *  闭包：函数的一种  类似于oc 的block
 *  闭包表达式（匿名函数）-- 能够获取上下文中的值
 *  语法：in 关键字的目的是便于区分返回值和执行语句
    闭包表达式的类型和函数的类型一样，是参数加上返回值，也就是in 之前的部分
 {
 （） -> 返回值类型 in
    执行语句
 }
 **/

let say:(String) ->Void  = {
    (name:String) -> Void in
    print("hello \(name)")
}

say("sss")

// 没有返回值写法
let say2:(String) -> Void = {
    (name:String) -> Void in
    print("hi \(name)")
}

/*** 闭包表达式当做回调函数 ***/
func showArr(arr:[Int]) {
    for num in arr {
        print(num)
    }
}

showArr(arr: [1,2,4,5,6,9])


//缺点不一定是从小到大，不一定是全部比较，有可能只是比较个位数
//所以，如何比较可以交给调用者决定


let cmp = {
    (a:Int ,b:Int) ->Int in
    if a>b {
        return a
    }else if a<b {
        return b
    }else{
        return -1
    }
}

func bubbleSort(array : inout [Int], cmp: (Int, Int) -> Int){
    for _ in 0..<array.count {
        for j in 0..<(array.count - 1) {
            if array[j] > array[j + 1] {
                let temp = array[j]
                array[j] = array[j + 1]
                array[j + 1] = temp
            }
        }
    }
}

// 闭包作为参数进行传递
var arr:Array<Int> = [23, 34, 56, 15, 8]

bubbleSort(array: &arr) { (a:Int, b:Int) -> Int in
    if a>b {
        return a
    }else if a<b {
        return b
    }else{
        return -1
    }
}

print(arr)

//闭包表达式优化
//1.类型优化，由于函数中已经声明了闭包参数的类型，所以传入的实参可以不用写类型
//2.返回值优化，同理由于函数中已经声明了闭包的返回值类型，所以传入的实参可以不用写类型
//3.参数优化 swift 可以使用$索引的方式来访问闭包的参数，默认从0 开始

bubbleSort(array: &arr){
    if $0 > $1{
        return 1
    }else if $0 < $1{
        return -1
    }else{
        return 0
    }
}


//如果闭包内部只有一条代码则可以省略 return
let hello = {
    "我日你仙人版本，恶心黑中介"
}

print(hello())


/**
自动闭包：顾名思义，自动闭包是一种自动创建的闭包，封装一堆表达式在自动闭包当中，然后将自动闭包作为参数再传给函数。而自动闭包是不接受任何参数的，但是可以返回自动闭包中表达式产生的值。
 自动闭包能让你延迟求值，知道调用到这个闭包，z闭包代码块才会被执行。说白了就是语法简介懒加载
 
 **/
var arr1 = ["1","123","hi","hello"]
print(arr1.count)

let deleteBlock = {arr1.remove(at: 2)}
print(arr1)

print("执行代码块移除\(deleteBlock())")
print(arr1)

/**
 *  逃逸闭包: 当一个闭包作为一个参数传到一个函数当中,需要这个闭包在函数返回之后才被执行，此闭包从函数中逃逸。一般如果闭包在函数体内涉及到异步操作，但是函数却很快就会执行完毕并且返回的，闭包必须要逃逸掉，以便异步操作的回调。
 *  逃逸闭包一般用于异步函数的回调，比如网络请求成功的回调和失败的回调。语法：在函数的闭包形参前添加关键字 “@escaping”
 */

//ex.1

func donSomething(some: @escaping() -> Void){
    //延时操作，注意这里的单位是秒
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
         //1s 后操作
        some()
    }
    
    print("函数体")
}

donSomething {
    print("逃逸闭包")
}

//Ex.2
var comletionHandle:() -> String = {"二手房东死全家!!"}

func doSomething2(some : @escaping() -> String){
    comletionHandle = some
}

doSomething2 { () -> String in
     return "灵车漂移"
}

print(comletionHandle())

//将一个闭包标记为 @escaping 意味着你必须在闭包中显示的引用self
//其实 @secaping 和 self 都是在提醒你，这是一个逃逸闭包
//别误操作导致了循环引用 而非逃逸闭包可以隐式引用self。

// 例子如下：
var completionAction:[() -> Void] = []
// 逃逸包
func someFunctionWithEscaping(completion : @escaping () -> Void){
    completionAction.append(completion)
}

// 非逃逸包
func someFunctionWithNoEscaping(cloure: () -> Void){
    cloure()
}

//闭包捕获值
func getIncFunc(inc:Int) -> (Int) ->Int{
    var max = 10
    func getIncFunc(x: Int) -> Int{
        print("incFunc 函数结束")
        max += 1
        return max + x
    }
    //当执行到这一句的时候inc 参数就应该被释放了，但是在内部函数中使用到了他，所有他被捕获了
    //同理，当执行完这一句是max 变量就被释放了，但是由于在内部函数中使用到了它，所以他被捕获了
    print("getIncFunc函数结束")
    return getIncFunc
}

//当捕获的值回合与之对应的方法绑定在一起，同一个方法中的变量会被绑定到不同的方法当中

let incFunc = getIncFunc(inc: 5)
print(incFunc(5))
print(incFunc(5))

let incFunc2 = getIncFunc(inc: 5)
print(incFunc2(5))









