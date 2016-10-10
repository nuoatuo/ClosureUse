//
//  HttpTools.swift
//  ClosureUse
//
//  Created by 古今 on 16/10/10.
//  Copyright © 2016年 夜风易冷. All rights reserved.
//

import UIKit

class HttpTools {
    
    var finishedCallback : ((_ jsonDat : String) -> ())?
    
    //闭包类型:(_ 参数列表) -> (返回值类型)
    //@escaping :逃逸的
    //swift中要求闭包的参数都不能是外部参数(参数前加“_”)
    func loadData(_ finishedCallback: @escaping (_ jsonDat : String) -> ())  {
        
        self.finishedCallback = finishedCallback
        
        //1.发送异步网络请求
        DispatchQueue.global().async {
            print("发送异步网络请求:\(Thread.current)")
            
            //2.回到主线程
            DispatchQueue.main.sync {
                print("回到主线程:\(Thread.current)")
                
                //3.进行回调
                finishedCallback("json数据")
            }
        }
        
    }
}
