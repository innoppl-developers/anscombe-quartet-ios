//
//  AQChartDetailViewController.m
//  anscombe-quartet-ios
//
//  Created by Terry Worona on 6/21/14.
//  Copyright (c) 2014 Jawbone. All rights reserved.
//

#import "AQChartDetailViewController.h"

// Views
#import "AQDataPointTableCell.h"

// Strings
NSString * const kAQChartDetailViewControllerCellIdentifier = @"kAQChartDetailViewControllerCellIdentifier";

@interface AQChartDetailViewController ()

@property (nonatomic, assign) AQDataModelChartType chartType;

@end

@implementation AQChartDetailViewController

#pragma mark - Alloc/Init

- (id)initWithChartType:(AQDataModelChartType)chartType
{
    self = [super init];
    if (self)
    {
        _chartType = chartType;
    }
    return self;
}

#pragma mark - View Lifecycle

- (void)loadView
{
    [super loadView];
    
    self.title = [NSString stringWithFormat:kJBStringLabelChartDetails, self.chartType + 1];
    [self.tableView registerClass:[AQDataPointTableCell class] forCellReuseIdentifier:kAQChartDetailViewControllerCellIdentifier];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[AQDataModel sharedInstance] dataForChartType:self.chartType] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AQDataPointTableCell *cell = [tableView dequeueReusableCellWithIdentifier:kAQChartDetailViewControllerCellIdentifier forIndexPath:indexPath];
    AQDataPoint *dataPoint = [[[AQDataModel sharedInstance] dataForChartType:self.chartType] objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"X: %f Y: %f", dataPoint.point.x, dataPoint.point.y];
    return cell;
}

@end
  