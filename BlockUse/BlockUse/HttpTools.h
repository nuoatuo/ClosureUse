//
//  HttpTools.h
//  BlockUse
//
//  Created by 古今 on 16/10/10.
//  Copyright © 2016年 夜风易冷. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpTools : NSObject


- (void)loadData:(void(^)(NSString *))finishedCallBack;

@end
