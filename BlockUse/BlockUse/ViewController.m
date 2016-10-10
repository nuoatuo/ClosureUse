//
//  ViewController.m
//  BlockUse
//
//  Created by 古今 on 16/10/10.
//  Copyright © 2016年 夜风易冷. All rights reserved.
//

#import "ViewController.h"
#import "HttpTools.h"

@interface ViewController ()
@property (nonatomic, strong) HttpTools *tools;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tools = [[HttpTools alloc] init];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    __weak ViewController *weakSelf = self;
    //闭包&控制器&HttpTools对象有没有形成循环引用
    [self.tools loadData:^(NSString *jsonData) {
       // NSLog(@"在控制器中，拿到数据:%@",jsonData);
        weakSelf.view.backgroundColor = [UIColor redColor];
    }];
}


- (void)dealloc {
    NSLog(@"ViewController ----- dealloc");
}

@end
