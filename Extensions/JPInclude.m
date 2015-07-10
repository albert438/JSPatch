//
//  JPInclude.m
//  JSPatchDemo
//
//  Created by bang on 15/6/29.
//  Copyright (c) 2015 bang. All rights reserved.
//

#import "JPInclude.h"

@implementation JPInclude
- (void)main:(JSContext *)context
{
    context[@"include"] = ^(NSString *filePath) {
        NSArray *component = [filePath componentsSeparatedByString:@"."];
        JSContext *_context = [JSContext currentContext];
        if (component.count > 1) {
            NSString *testPath = [[NSBundle bundleForClass:[self class]] pathForResource:component[0] ofType:component[1]];
            NSString *script = [[NSString alloc] initWithData:[[NSFileManager defaultManager] contentsAtPath:testPath] encoding:NSUTF8StringEncoding];
            NSArray *arguments = [JSContext currentArguments];
            if (arguments.count == 1 || (arguments.count ==2 && [[arguments[1] toNumber] isEqualToNumber:@0])) {
                [JPEngine evaluateScript:script];
            }else if(arguments.count == 2 && [[arguments[1] toNumber] isEqualToNumber:@1]) {
                [_context evaluateScript:script];
            }
            
        }
    };
}
@end
