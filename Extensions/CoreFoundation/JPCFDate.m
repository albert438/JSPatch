//
//  JPCFDate.m
//  JSPatchDemo
//
//  Created by 梁力图 on 15/7/9.
//  Copyright (c) 2015年 bang. All rights reserved.
//

#import "JPCFDate.h"

@implementation JPCFDate

- (void)main:(JSContext *)context
{
    context[@"kCFAbsoluteTimeIntervalSince1970"] = [NSNumber numberWithDouble:kCFAbsoluteTimeIntervalSince1970];
    
    context[@"kCFAbsoluteTimeIntervalSince1904"] = [NSNumber numberWithDouble:kCFAbsoluteTimeIntervalSince1904];
    
    context[@"CFAbsoluteTimeGetCurrent"] = ^double() {
        return CFAbsoluteTimeGetCurrent();
    };
}

@end
