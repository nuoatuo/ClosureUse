//
//  ViewController.swift
//  ClosureUse
//
//  Created by 古今 on 16/10/10.
//  Copyright © 2016年 夜风易冷. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var httpTools : HttpTools?
    
    //在swift中，只要是对父类的方法进行重写，必须在方法前面加上override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        httpTools = HttpTools()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        /*
         self. 一般是可以省略掉
         1>如果该方法中有局部变量和成员属性有歧义(名称相同)
         2>在闭包中使用成员属性
         */
        
        //问题:有没有形成循环引用
        //weak var weakSelf : ViewController? = self
        weak var weakSelf  = self

        httpTools?.loadData({ (jsonData : String) in
             //print("在ViewController获取到数据:\(jsonData)")
            weakSelf?.view.backgroundColor = UIColor.red
        })
    }
    
    deinit {
        print("ViewController ---- deinit")
    }
}

