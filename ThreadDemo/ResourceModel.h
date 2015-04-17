//
//  ResourceModel.h
//  ThreadDemo
//
//  Created by John on 15/4/17.
//  Copyright (c) 2015年 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResourceModel : NSObject
@property (nonatomic,strong)NSMutableArray *objcetArr;
-(void)addobject:(NSString *)obj;
-(NSString *)takeObject;

@end
