//
//  ViewController.m
//  ConsoleDemo
//
//  Created by Ernesto Rivera on 2013/11/13.
//  Copyright (c) 2013-2014 PTEz.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "ViewController.h"
#import <CocoaLumberjack/DDLog.h>

static int ddLogLevel = LOG_LEVEL_VERBOSE;

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self generateRandomLogMessage];
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
    double delayInSeconds = (arc4random() % 100) / pow(10.0, self.paceSlider.value);
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self generateRandomLogMessage];
    });
}

@end

