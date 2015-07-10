//
//  JPFoundation.m
//  JSPatchDemo
//
//  Created by 梁力图 on 15/7/9.
//  Copyright (c) 2015年 bang. All rights reserved.
//

#import "JPFoundation.h"

@implementation JPFoundation

-(void)main:(JSContext *)context
{
    [JPEngine addExtensions:@[[JPNSObjCRuntime instance],[JPNSPathUtilities instance]]];
}

@end
