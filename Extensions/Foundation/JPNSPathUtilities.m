//
//  JSNSPathUtilities.m
//  JSPatchDemo
//
//  Created by 梁力图 on 15/7/9.
//  Copyright (c) 2015年 bang. All rights reserved.
//

#import "JPNSPathUtilities.h"

@implementation JPNSPathUtilities
-(void)main:(JSContext *)context
{
    context[@"NSSearchPathForDirectoriesInDomains"] = ^NSArray *(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde) {
        return NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
    };
    
    context[@"NSHomeDirectory"] = ^NSString *() {
        return NSHomeDirectory();
    };
    
    context[@"NSTemporaryDirectory"] = ^NSString *() {
        return NSTemporaryDirectory();
    };
}
@end
