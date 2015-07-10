//
//  JPNSObjCRuntime.m
//  JSPatchDemo
//
//  Created by 梁力图 on 15/7/9.
//  Copyright (c) 2015年 bang. All rights reserved.
//

#import "JPNSObjCRuntime.h"

@implementation JPNSObjCRuntime
-(void)main:(JSContext *)context
{
    context[@"NSClassFromString"] = ^id(NSString *className) {
        return [self formatClassOCToJS:NSClassFromString(className)];
    };
    
    context[@"NSStringFromClass"] = ^NSString *(JSValue *class) {
        return NSStringFromClass([self formatClassJSToOC:class]);
    };
}
@end
