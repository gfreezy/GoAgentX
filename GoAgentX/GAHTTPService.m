//
//  GAHTTPService.m
//  GoAgentX
//
//  Created by 超 费 on 8/2/14.
//  Copyright (c) 2014 xujiwei.com. All rights reserved.
//

#import "GAHTTPService.h"
#import "GACommandRunnerPlaceholder.h"

@implementation GAHTTPService

- (NSString *)serviceName {
    return @"HTTP";
}


- (NSString *)serviceTitle {
    return @"HTTP";
}


- (NSString *)configPath {
    return nil;
}


- (BOOL)supportReconnectAfterDisconnected {
    return NO;
}


- (BOOL)autoDisconnectWhenNetworkIsUnreachable {
    return NO;
}


- (BOOL)hasConfigured {
    return [self proxyAddress].length > 0;
}


- (int)proxyPort {
    return (int)[[NSUserDefaults standardUserDefaults] integerForKey:@"HTTP:Port"];
}

- (NSString *)proxyAddress {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults stringForKey:@"HTTP:Address"];
}

- (bool)listenOnRemote {
    return YES;
}


- (NSArray *)proxyTypes {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ((int)[defaults integerForKey:@"HTTP:ProxyType"] == 0) {
        return @[@"PROXY"];
    } else {
        return @[@"SOCKS5", @"SOCKS"];
    }
}

- (void)setupWorkDirectory {
    
}

- (void)setupCommandRunner {
    if (!commandRunner) {
        commandRunner = [[GACommandRunnerPlaceholder new] init];
    }
    __block id _self = self;
    commandRunner.terminationHandler = ^(NSTask *task) {
        [_self notifyStatusChanged];
    };
}

@end
