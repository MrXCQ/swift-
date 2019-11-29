//
//  ViewController.swift
//  方 法
//
//  Created by zc on 2018/9/7.
//

import UIKit

class ViewController: UIViewController {
    
    /*   构造方法：
     *   作用：对实例对象的内容进行初始化
     *   swift 要求类或者结构体中的存储属性（非lazy）在对象的构造完毕后要有构造化值
     *   语法： init（参数列表）{初始化代码}
     *   注意：
     *   1、在swift中类、结构体、枚举 都需要有构造方法
     *   2、构造方法的作用仅仅是用于初始化属性，而不是分配内容，分配内存是系统帮我们做的
     *   3、构造方法是隐式调用的，通过 类名称（）形成一个对象就会隐式调用 init（）构造方法
     4、如果所有的存储属性都有默认值，可以不提供构造方法，系统会提供一个隐式的构造方法
     5、如果存储属性可以提供缺省，那么提倡使用设置缺省值的方法，这样可以简化代码
     **/
    
    class Person {
        var name: String = "dfdfj"
        var age : Int
        
        func description() -> String {
            return "name ====  \(name)  age ==== \(age)"
        }
        
        init() {
            print("init")
            age = 30
        }
    }
    
    /**** 带有参数的构造方法 ****/
    class Person2 {
        var name :String
        var age : Int
        func description() -> String {
            return "name === \(name)  age ==== \(age)"
        }
        
        //构造方法的内部参数，默认也是外部参数
        //函数的内部参数默认不会当做外部参数
        //方法的的内部参数，从第二个开始才会当做外部参数
        //构造方法对属性的顺序没有要求，只要保证对象的构造完时所有的存储属性被初始化即可
        init(age :Int , name : String) {
            self.name = name
            self.age  = age
        }
        func setName(name : String, age : Int)  {
            self.name = name
            self.age = age
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        
        let button : UIButton = UIButton.init(type: .custom)
        button.frame = CGRect.init(x: 0, y: 0, width: 100, height: 100)
        button.center = self.view.center
        button.backgroundColor = UIColor.black
        button.setTitle("HaHa", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button .addTarget(self, action: #selector(click(button:)), for: .touchUpInside)
        self.view .addSubview(button)
        
        
        let p = Person()
        let description :String = p.description()
        print(p.age,description)

        
    }
    
    @objc func click(button: UIButton){
        print("title ---- \(button.titleLabel?.text ?? "")")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

