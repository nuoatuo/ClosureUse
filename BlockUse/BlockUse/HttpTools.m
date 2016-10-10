//
//  HttpTools.m
//  BlockUse
//
//  Created by 古今 on 16/10/10.
//  Copyright © 2016年 夜风易冷. All rights reserved.
//

#import "HttpTools.h"

@interface HttpTools ()
@property (nonatomic, copy) void (^finishedCallBack)(NSString *);
@end
@implementation HttpTools

- (void)loadData:(void (^)(NSString *))finishedCallBack {
    
    self.finishedCallBack = finishedCallBack;
    
    //1.发送网络的异步请求
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"已经发送了网络请求:%@", [NSThread currentThread]);
        
        //2.回到主线程
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"回到主线程:%@", [NSThread currentThread]);
            
            //3.获取数据，并且将数据回调出去
            finishedCallBack(@"json数据");
        });
        
    }) ;
   
}
@end
