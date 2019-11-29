//
//  ViewController.swift
//  函数的定义和使用
//
//  Created by zc on 2018/7/13.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        sayHi()
        sayHi1()
        sayWithName(name: "XCQ")
        SayWithNameAndAge(name: "XCQ", age: 24)
        print(sayHello())
        print(countSum(s1: 123, s2: 200))
        
        showArray(Arr: [1,2,223,77,89,455,9,33])
        
        var arr:Array<Int> = [2,4,52,3,66,124,6858]
        
        bubbleSort(Arr1: &arr)
        
        print("冒泡排序  ----  \(arr)")
        
        var arr2:Array<Int> = [2,4,52,3,66,124,6858]

        insertSort(Arr: &arr2)
        
        print("插入排序  ------ \(arr2)")
        
        
        var arr3:Array<Int> = [2,46,823,3,6,1,97]
        
        print("选择排序  ---  \(selectSort(arr: &arr3))")
        
        
        swapTest(a: 20, b: 30)
        
        // 有点意思
        print(add4(otherNum: 100, nums: 1,2,3,4))
        
    }
    
    //无参无返回值
    func sayHi() -> Void {
         print("Say Hi !")
    }
    
    // 如果没有返回值可以不写后
    func sayHi1(){
         print("Say Hello!")
    }
    
    // 有参无返回值
    func sayWithName(name:String){
         print("Hello  \(name)")
    }
    
    func SayWithNameAndAge(name:String,age:Int){
        print("Hello \(name),I am \(age) years old")
    }
    
    //无参有返回值
    func sayHello() -> Int {
         return 22
    }
    
    // 有参数有返回值
    func countSum(s1:Int,s2:Int) -> Int {
         return s1 + s2
    }
    
    //MARK:嵌套函数
    func showArray(Arr:[Int]){
        for num in Arr.sorted() {
            print("number  ----  \(num)")
        }
        
        let arr = Arr .sorted { (s1, s2) -> Bool in
            s1 > s2
        }
        
        for num in arr{
            print("num  ----  \(num)")
        }
    }
    
    //MARK: 冒泡排序，插入排序，选择排序，快速排序
    //1.冒泡排序
    func bubbleSort(Arr1:inout [Int])
    {
        
        // 循环 Count 次
        for _ in 0..<Arr1.count {
            for j in 0..<(Arr1.count - 1) {
                if Arr1[j] > Arr1 [j + 1] {
                    let temp = Arr1[j]
                    Arr1[j] = Arr1[j+1]
                    Arr1[j+1] = temp
                }
            }
        }
    }
    
    
    //2.插入排序
    func insertSort(Arr:inout [Int]){
        for i  in (0..<Arr.count) {
            
            let k1  = Arr[i]
            
            var j = i - 1
            
            while j >= 0{
                if Arr[j] > k1 {
                    Arr[j + 1] = Arr[j]
                    Arr[j] = k1
                }
                j -= 1
            }
        }
    }
    
    // 3.选择排序
    func selectSort(arr:inout [Int]) -> Any {
        for i in (0..<arr.count - 1) {
            var index = i
            for j in (i..<arr.count){
                if arr[index] > arr[j]{
                    index = j
                }
            }
            let tmp = arr[i]
            arr[i] = arr[index]
            arr[index] = tmp
        }
        return arr
    }
    
    //MARK: 函数参数
    
    /**
     *  常量参数和遍历参数:
     *  默认情况下swift 中的所有函数的参数都是常量函数，如果想在函数中修改函数必须在参数前加上var
     *  inout 参数，如果想在函数中修改外接传入的函数，可以将参数的var 换成 inout 传递的参数本身不是参数的值
     */
    
    func swapTest(a:Int,b:Int){
        var a = a
        var b = b
        
        print("交换前 a = \(a) ,b = \(b)")
        let temp = a
        a = b
        b = temp
        print("交换后 a = \(a) ,b = \(b)")
        
    }
    
    
    func add4(otherNum:Int ,nums:Int...) -> Int {
        var sum = 0
        for num in nums {
            sum += num
        }
        
        return sum + otherNum
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

