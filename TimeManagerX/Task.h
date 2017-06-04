//
//  Task.h
//  TimeManagerX
//
//  Created by yu on 2017/6/4.
//  Copyright © 2017年 yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject
@property(nonatomic,copy)NSString  *taskName;
@property(nonatomic,copy)NSString  *taskDate;
@property(nonatomic,copy)NSString  *taskTime;
@property(nonatomic,copy)NSString  *taskTimeA;
@property(nonatomic,copy)NSString  *taskTimeB;
@property(nonatomic,copy)NSString  *taskLocation;
@property(nonatomic,copy)NSString  *taskRemarks;
@end
