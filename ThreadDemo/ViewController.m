//
//  ViewController.m
//  ThreadDemo
//
//  Created by John on 15/4/17.
//  Copyright (c) 2015年 Eric. All rights reserved.
//

#import "ViewController.h"
#import "ResourceModel.h"

@interface ViewController ()
{
    ResourceModel *_model;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _model = [[ResourceModel alloc]init];
    
  
    
    [NSThread detachNewThreadSelector:@selector(takeObject) toTarget:self withObject:nil];
    
    [NSThread detachNewThreadSelector:@selector(takeObject) toTarget:self withObject:nil];
    
    [NSThread detachNewThreadSelector:@selector(addResourceObject:) toTarget:self withObject:@"面包"];
    [NSThread detachNewThreadSelector:@selector(addResourceObject:) toTarget:self withObject:@"牛奶"];
    
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)takeObject{
    while (true) {
        [_model takeObject];
       // NSLog(@"%@",sr);
    }
}


-(void)addResourceObject:(NSString *)str{
    
    while (true) {
        [_model addobject:str];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
