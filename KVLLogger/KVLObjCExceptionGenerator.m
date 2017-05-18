//
//  KVLObjCExceptionGenerator.m
//  KVLLogger
//
//  Created by Misha on 18/05/2017.
//  Copyright © 2017 Misha Koval. All rights reserved.
//

#import "KVLObjCExceptionGenerator.h"

@implementation KVLObjCExceptionGenerator

- (NSException*)generateException
{
    @try {
        [self removeObserver:self forKeyPath:@"contentOffset"];
    }
    @catch (NSException * __unused exception) {
        return exception;
    }
    
    return [NSException new];
}

@end
