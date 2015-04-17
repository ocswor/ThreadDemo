//
//  ResourceModel.m
//  ThreadDemo
//
//  Created by John on 15/4/17.
//  Copyright (c) 2015年 Eric. All rights reserved.
//

#import "ResourceModel.h"

@implementation ResourceModel
{
    NSLock *_myLock;
    
    NSCondition *_conditionLock;
    
    BOOL _flag;
}
-(id)init{
    self = [super init];
    if (self) {
        _objcetArr = [[NSMutableArray alloc]initWithCapacity:10];
        _myLock = [[NSLock alloc]init];
        
        _conditionLock = [[NSCondition alloc]init];
        
        _flag = NO;
    }
    return self;
}

-(void)addobject:(NSString *)obj{
    
    [_conditionLock lock];
    while (_flag) {
        [_conditionLock wait];
    }
      
    [_objcetArr addObject:obj];
    NSLog(@"%@--生产------%@",[[NSThread currentThread] name],obj);

    
    _flag = YES;
    [_conditionLock unlock];
    [_conditionLock broadcast];
    
    
}

-(NSString *)takeObject{
    NSString *obj;
    
    [_conditionLock lock];
    while(!_flag){
        
        [_conditionLock wait];

    }

    obj = [_objcetArr lastObject];
    [_objcetArr removeLastObject];
 
    
    _flag = NO;
    [_conditionLock unlock];
    [_conditionLock broadcast];
    
    NSLog(@"%@--消费--%@",[[NSThread currentThread] name],obj);
    return obj;
}
@end
