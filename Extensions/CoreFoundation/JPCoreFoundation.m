//
//  JPCoreFoundation.m
//  JSPatchDemo
//
//  Created by 梁力图 on 15/7/9.
//  Copyright (c) 2015年 bang. All rights reserved.
//

#import "JPCoreFoundation.h"
#import "JPEngine.h"
@implementation JPCoreFoundation

-(void)main:(JSContext *)context
{
    [JPEngine addExtensions:@[[JPCFRunLoop instance],[JPCFDate instance]]];
}

@end
