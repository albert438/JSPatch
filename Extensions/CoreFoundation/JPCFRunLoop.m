//
//  CFRunLoop.m
//  JSPatchDemo
//
//  Created by 梁力图 on 15/7/9.
//  Copyright (c) 2015年 bang. All rights reserved.
//

#import "JPCFRunLoop.h"

@implementation JPCFRunLoop

- (void)main:(JSContext *)context
{
    __weak JSContext *weakCtx = context;
    
    context[@"NSDefaultRunLoopMode"]  = NSDefaultRunLoopMode;
    
    context[@"UITrackingRunLoopMode"] = UITrackingRunLoopMode;
    
    context[@"CFRunLoopGetCurrent"]   = ^id() {
        CFRunLoopRef currentRunLoop = CFRunLoopGetCurrent();
        return [self formatPointerOCToJS:currentRunLoop];
    };
    
    context[@"CFRunLoopGetMain"]      = ^id() {
        CFRunLoopRef mainRunLoop =  CFRunLoopGetMain();
        return [self formatPointerOCToJS:mainRunLoop];
    };
    
    context[@"CFRunLoopPerformBlock"] = ^void(JSValue *rl, NSString const * mode, JSValue *func) {
        JSValue *currSelf = weakCtx[@"self"];
        CFRunLoopRef runLoop = [self formatPointerJSToOC:rl];
        CFRunLoopPerformBlock(runLoop, (__bridge CFStringRef)mode, ^{
            JSValue *prevSelf = weakCtx[@"self"];
            weakCtx[@"self"] = currSelf;
            [func callWithArguments:nil];
            weakCtx[@"self"] = prevSelf;
        });
    };
    
    context[@"CFRunLoopAddTimer"]     = ^void(JSValue *rl, JSValue *timerVal, NSString *mode) {
        NSTimer *timer = [self formatJSToOC:timerVal];
        NSAssert([timer isKindOfClass:[NSTimer class]],@"invalid parameters type");
        CFRunLoopAddTimer([self formatPointerJSToOC:rl], (__bridge CFRunLoopTimerRef)timer, (__bridge CFStringRef)mode);
    };
    
    context[@"CFRunLoopRun"]          = ^void() {
        CFRunLoopRun();
    };
    
    context[@"CFRunLoopStop"]         = ^void(JSValue *rl) {
        CFRunLoopStop([self formatPointerJSToOC:rl]);
    };
}

@end
