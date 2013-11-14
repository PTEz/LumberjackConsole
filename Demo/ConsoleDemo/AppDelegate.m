//
//  AppDelegate.m
//  ConsoleDemo
//
//  Created by 利辺羅 on 2013/11/13.
//  Copyright (c) 2013年 PTEz. All rights reserved.
//

#import "AppDelegate.h"
#import <LumberjackConsole/PTEDashboard.h>

static int ddLogLevel = LOG_LEVEL_VERBOSE;

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Add the console dashboard
    [DDLog addLogger:[PTEDashboard sharedDashboard].logger];
    
    DDLogInfo(@"Added console dashboard");
    
    [self generateRandomLogMessage];
    
    return YES;
}

- (void)generateRandomLogMessage
{
    // Random message format
    NSString * format = (arc4random() % 2) ? @"Short %@ log message" : @"Long\nmulti-line\n%@\nlog\nmessage, TAP ME!";
    
    // Random level
    NSUInteger randomLevel = arc4random() % 5;
    
    // Log
    switch (randomLevel)
    {
        case 4:
            DDLogError(format, @"error");
            break;
        case 3:
            DDLogWarn(format, @"warning");
            break;
        case 2:
            DDLogInfo(format, @"information");
            break;
        case 1:
            DDLogDebug(format, @"debug");
            break;
        default:
            DDLogVerbose(format, @"verbose");
            break;
    }
    
    // Schedule next message
    double delayInSeconds = (arc4random() % 100) / 10.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self generateRandomLogMessage];
    });
}

@end

