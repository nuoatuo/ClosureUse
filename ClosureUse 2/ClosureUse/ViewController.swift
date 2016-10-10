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

        //解决循环引用方案:
         //解决方案一：
        /*
        weak var weakSelf  = self
        httpTools?.loadData({ (jsonData : String) in
            weakSelf?.view.backgroundColor = UIColor.red
        })
         */
        
        //解决方案二:
        /*
        httpTools?.loadData({[weak self] (jsonData : String) in
            self?.view.backgroundColor = UIColor.red
        })*/
        
        //解决方案三:
        //unowned ---> unsafe_unretained(野指针)
        httpTools?.loadData({[unowned self] (jsonData : String) in
            self.view.backgroundColor = UIColor.red
            })
        
        //尾随闭包的概念
        //如果在函数中，闭包是最后一个参数，那么可以写成尾随闭包
        httpTools?.loadData() {
            [unowned self] (jsonData : String) in
            self.view.backgroundColor = UIColor.red
        }
        //如果是唯一的参数，也可以将前面的（）省略掉
        httpTools?.loadData {
            [unowned self] (jsonData : String) in
            self.view.backgroundColor = UIColor.red
        }
    }
    
    deinit {
        print("ViewController ---- deinit")
    }
}

