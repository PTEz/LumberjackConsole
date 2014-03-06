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
#import <LumberjackConsole/PTEConsoleLogger.h>

static int ddLogLevel = LOG_LEVEL_VERBOSE;

@implementation ViewController
{
    PTEConsoleLogger * _customConsoleLogger;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Add a custom console
    _customConsoleLogger = [PTEConsoleLogger new];
    _customConsoleLogger.tableView = self.customConsoleTableView;
    [DDLog addLogger:_customConsoleLogger];
    
    DDLogInfo(@"Added a custom console logger");
}

@end

