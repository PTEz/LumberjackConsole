//
//  PTEConsoleTableViewController.m
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

#import "PTEConsoleTableViewController.h"
#import "PTEConsoleTableView.h"
#import "PTEConsoleLogger.h"

NS_ASSUME_NONNULL_BEGIN
@interface PTEConsoleTableViewController()
/// @name Outlets
@property (weak, nonatomic) IBOutlet  PTEConsoleTableView * tableView;

/// The UISearchBar used to filter log messages.
@property (weak, nonatomic) IBOutlet    UISearchBar * searchBar;

@end

@implementation PTEConsoleTableViewController
@synthesize logger = _logger;

- (BOOL)prefersStatusBarHidden
{
    // Fixes missing status bar.
    return NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableHeaderView = self.searchBar;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self resetLogger];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    self.logger.tableView = nil;
    self.searchBar.text = @"";
    [self.logger searchBar:self.searchBar textDidChange:self.searchBar.text];
}

- (void) resetLogger {
    self.logger.tableView = self.tableView;
    self.tableView.delegate = self.logger;
    self.tableView.dataSource = self.logger;
    self.searchBar.delegate = self.logger;
    [self.tableView reloadData];
}

- (void) setLogger:(nullable PTEConsoleLogger *)logger {
    _logger = logger;
    [self resetLogger];
}

- (nullable PTEConsoleLogger*) logger {
    return _logger;
}

- (IBAction)clearConsole:(id)sender
{
    [self.logger clearConsole];
}

- (IBAction)addMarker:(id)sender
{
    [self.logger addMarker];
}


@end

NS_ASSUME_NONNULL_END
