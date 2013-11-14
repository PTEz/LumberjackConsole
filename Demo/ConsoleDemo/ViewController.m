//
//  ViewController.m
//  ConsoleDemo
//
//  Created by 利辺羅 on 2013/11/13.
//  Copyright (c) 2013年 PTEz. All rights reserved.
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

