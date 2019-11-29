//
//  ViewController.swift
//  类
//
//  Created by zc on 2018/8/28.
//

import UIKit

/**
 *  类的基本定义：类是具有相同属性和方法的抽象
 *  swift 中的结构体和类十分的相似，肯定也有不同之处
 *  格式：class 类名称 { 类的属性和方法 }
 */
class rect{
    var width:Double = 0.0
    var height:Double = 0.0
    func show(){
        print("width ---\(width),height --- \(height)")
    }
}

/**
 *  储存属性 ：其实swift 中的存储属性就是OC 中的普通属性，在结构体或者类中定义的属性，默认就是存储属性
 *
 */

struct Person {
    var name: String
    var age : Int
}

/**
 *  常量存储属性： 智能在定义是或者构造时修改，构造一个对象之后不能对常量存储属性进行修改
 */

struct Person2 {
    var name : String
    var age: Int
    let userID : String // 常量ID
}


/**
 *  结构体和类常量与存储属性的关系
 *  结构体和枚举是值类型  类是引用类型
 **/

struct Person3 {
    var name : String
    var age  : Int
}


class Person4 {
    var name : String = ""
    var age  : Int = 20
}

/**
 *   延迟存储属性
 *   swift 语言中所有的存储属性必须要有初始值，也就是当构造完一个对象后，对象中所有的存储属性都必须要有初始值，但是有例外其中
 *   延迟存储的属性可以将属性的初始化推迟到该属性第一次被调用的时候
 *   懒加载应用场景
 **/

class Line {
    var start : Double = 0.0
    var end:Double = 0.0
    
    // 1.如果不是lazy 属性定义的时候对象还没有初始化们所有不能访问self
    // 2.如果加上lazy 代表使用时才会加载，也就是使用到length 属性时才会调用self
    // 3.而访问一个类的属性必须通过对象方法，所以访问对象已经初始化完成了，可以使用self
    
    lazy var length:Double = self.getLength()
    
    //通过闭包懒加载
    lazy var container: Array<AnyObject> = {
       print("懒加载")
        var arrM:Array<Int> = []
        return arrM as [AnyObject]
    }()
    
    func getLength() -> Double {
        print("懒加载")
        return end - start
    }
}


/**
 *   计算属性
 *   1.swift 中的计算属性不直接存储值，跟存储属性不同，没有任何的“后端存储与之对应”
 *   2.计算属性用于计算，可以实现setter 和 getter 这两种计算方法
 *   3.枚举不可以有存储属性，但是允许有计算属性
 *   setter 对象.属性 = 值
 *   getter var value = 对象.属性
 */

struct Rect {
    var origion:(x:Double , y:Double) = (0,0)
    var size:(width: Double , height: Double) = (0,0)
    
    //由于center 的值是通过起点和宽高计算出来的，所以没有必要提供一个存储属性
    var center: (x:Double ,y:Double) {
        get {
             return (origion.x + size.width/2 ,origion.y + size.height/2)
        }
        set{
            //注意 ：计算属性不具备存储功能，所以不能给计算属性赋值，如果赋值会发生运行时错误
            //注意 ：setter 可以自己传递一个参数，也可以使用系统默认的参数newValue
            //如果要使用系统自带的参数 必须要删除自定义参数
            origion.x = newValue.x - size.width / 2
            origion.y = newValue.y - size.height / 2
        }
    }
    
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        //类没有逐一构造器
        let rect1 = rect()
        rect1.width = 9.2
        rect1.show()
        
        let r2 = rect()
        r2.width = 9.1
        r2.show()
        
        // 结构体能够使用逐一构造器
        var p = Person(name: "daxia", age: 12)
        print("name --- \(p.name),age --- \(p.age)")
        
        p.name = "XCQ"
        p.age = 134
        print("name --- \(p.name),age --- \(p.age)")
        
        var p2 = Person2(name: "WuDi", age: 23, userID: "455")
        p2.name = "dfdf"
        p2.age = 34
        //p2.userID = "23" 无法修改

        print(p2)
        
        let p3 = Person3(name: "xcq", age: 123)
        //因为结构体是值类型，所以不能够修改结构体常量中的属性
        //不能修改结构体或枚举常量对象中的值，因为他指向的对象是一个常量
        
        
        let p4 : Person4 = Person4()
        //可以修改类中常量的值，因为他们指向的对象不是一个常量
        p4.name = "hello world !"
        //不可以修改类常量的指向
        //p4 = Person4()
        
        // 懒加载
        var line = Line()
        
        line.end = 200.0
        line.start = 12.4
        print("创建对象完毕")
        print(line.length)
        
        var arrM = line.container
        arrM .append("1" as AnyObject)
        arrM .append(5 as AnyObject)
        arrM .append("xdf" as AnyObject)
        print(arrM)
        
        //setter getter
        var r = Rect()
        r.origion = (0,0)
        r.size = (100,100)
        
        print("centerX ---- \(r.center.x) , centerY ---- \(r.center.y)")
        
        r.center = (100,100)
        print("origion.X --- \(r.origion.x), origionY ------ \(r.origion.y)")
        print("centerX ---- \(r.center.x) , centerY ---- \(r.center.y)")
        
        
        // 只读属性
        var lineclass = Line2()
        lineclass.start = 56.9
        lineclass.end = 110.9
        //lineclass.length = 213.9
        print("length ----- \(lineclass.length)")
        

        // 观察属性 类似于KVO
        var line3Class = Line3()
        line3Class.start =  10.0
        line3Class.start =  8.0
        
        //类属性 有点类似于OC 的类方法
        var p5 = Person5()
        //print("gender ----  \(p5.gender)")
        
        Person5.gender = "women"
        print("p5.gender --- \(Person5.gender)")
        
    }
    
    /**
     *  只读计算属性
     *  对应OC 中的readonly 属性，所谓的只读属性就是只提供了getter 方法，没有提供 setter 方法
     *
     ***/
    
    class Line2 {
        var start :Double = 0.0
        var end : Double = 0.0
        //只读属性，只读属性必须是变量var 不能是常量let
        //比如想获取length 只能通过计算获得，而不需要外界设置，可以设置为只读计算属性
        var length : Double{
            return end - start
        }
    }
    
    /**
     *   属性观察器,类似OC 中的KVO，可以用于监听属性什么时候被修改，只有属性被修改才会调用
     *   有两种属性观察器：
     *   1、willset 在设置新值前调用
     *   2、didSet 在设置新值后调用
     *   可以直接为除计算属性和lazy 属性之外的存储属性添加属性观察器，但是可以在继承类中为父类的计算属性提供属性观察器
     *   因为在计算属性中也可以监听到属性的改变，所以给计算属性添加属性观察器没有任何的意义
     **/
    class Line3 {
        var start: Double = 0.0 {
            willSet{
                print("willSet newVlaue ==== \(newValue)")
            }
            didSet {
                print("didSet oldValue ===== \(oldValue)")
            }
        }
        
        var end:Double = 0.0
        
    }
    
    /**
     *  类属性 在结构体和枚举中用 static
     *  在类中使用class 并且类中不允许将存储属性设置为类属性
     **/
    struct Person5 {
        //普通的属性是每个对象的一份
        var name:String = "xdf"
        //类属性是素有对象共用一份
        static var gender : String = "man"
        static var age: Int {
            return 25
        }
        
        func show() {
             print("gender ----- \(Person5.gender)  name ==== \(name)")
        }
    }
    
    
    //普通属性是每个对象一份
    class Person6 {
        var name: String = "sddf"
        //类中不允许将存储属性定义为类属性
        //class var gender: String  = "man"
        //类中智能将计算属性定义为属性
        class var age: Int {
             return 26
        }
        
        func show() {
             print("age ===== \(Person6.age)")
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

