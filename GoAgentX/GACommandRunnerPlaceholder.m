//
//  GACommandRunnerPlaceholder.m
//  GoAgentX
//
//  Created by 超 费 on 8/3/14.
//  Copyright (c) 2014 xujiwei.com. All rights reserved.
//

#import "GACommandRunnerPlaceholder.h"

@implementation GACommandRunnerPlaceholder {
    BOOL isRunning;
}

- (instancetype)init {
    if (self = [super init]) {
        isRunning = NO;
    }
        
    return self;
}

- (BOOL)isTaskRunning {
    return isRunning;
}

- (void)terminateTask {
    isRunning = NO;
    self.terminationHandler(nil);
}

- (int)processId {
    return 0;
}

- (void)run {
    isRunning = YES;
}

@end
