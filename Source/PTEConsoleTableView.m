//
//  PTEConsoleTableView.m
//  LumberjackConsole
//
//  Created by Ernesto Rivera on 2014/04/09.
//  Copyright (c) 2013-2017 PTEz.
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

#import "PTEConsoleTableView.h"
#import "PTEConsoleLogger.h"
#import <NBUCore/NBUCore.h>

@implementation PTEConsoleTableView

- (instancetype)initWithFrame:(CGRect)frame
                        style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame
                          style:style];
    if (self)
    {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self)
    {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    // Default settings
    self.allowsMultipleSelection = YES;
    self.rowHeight = 20.0;
}

@end

