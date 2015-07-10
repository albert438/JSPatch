//
//  JPMemory.m
//  JSPatchDemo
//
//  Created by Albert438 on 15/7/6.
//  Copyright (c) 2015年 bang. All rights reserved.
//

#import "JPMemory.h"

@implementation JPMemory

- (void)main:(JSContext *)context
{
    context[@"memset"]  = ^void(JSValue *jsVal, int ch,size_t n) {
        memset([self formatPointerJSToOC:jsVal], ch, n);
    };

    context[@"memmove"] = ^id(JSValue *des, JSValue *src, size_t n) {
        void *ret = memmove([self formatPointerJSToOC:des], [self formatPointerJSToOC:src], n);
        return [self formatPointerOCToJS:ret];
    };

    context[@"memcpy"]  = ^id(JSValue *des, JSValue *src, size_t n) {
        void *ret = memcpy([self formatPointerJSToOC:des], [self formatPointerJSToOC:src], n);
        return [self formatPointerOCToJS:ret];
    };

    context[@"malloc"]  = ^id(size_t size) {
        void *m = malloc(size);
        return [self formatPointerOCToJS:m];
    };
    
    context[@"free"]    = ^void(JSValue *jsVal) {
        void *m = [self formatPointerJSToOC:jsVal];
        free(m);
    };
}


@end
