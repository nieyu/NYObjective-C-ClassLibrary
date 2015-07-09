//
//  ViewController.m
//  NYObjective_C
//
//  Created by nieyu on 7/5/15.
//  Copyright (c) 2015 YuNie. All rights reserved.
//

#import "ViewController.h"

static NSString *indentifier = @"resuse";

@interface ViewController ()
<UITableViewDataSource,
 UITableViewDelegate>

@property (nonatomic, strong) UITableView           *tableView;

@property (nonatomic, strong) NSArray               *dataSource;

@property (nonatomic, strong) NSArray               *indexList; //索引

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    
    [self initFrame];
}

- (void)initData
{
    self.dataSource = [NSArray arrayWithObjects:@"circel by CAShapeLayer", nil];
    self.indexList = [NSMutableArray arrayWithObjects:
                      @"A", @"B", @"C", @"D", @"E", @"F",
                      @"G", @"H", @"I", @"J", @"K", @"L",
                      @"M", @"N", @"O", @"P", @"Q", @"R",
                      @"S", @"T", @"U", @"V", @"W", @"X",
                      @"Y", @"Z", @"#", nil
                      ];
}

- (void)initFrame
{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    UIView *tableViewBackgroundView = [[UIView alloc] initWithFrame:self.view.bounds];
    [tableViewBackgroundView setBackgroundColor:[UIColor greenColor]];
    [self.tableView setBackgroundView:tableViewBackgroundView];
    [self.tableView setSeparatorColor:[UIColor whiteColor]];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:indentifier];
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:indentifier
                                           forIndexPath:indexPath];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, SCREEN_WIDTH / 5, 20)];
    [label setText:@"abc"];
    [label setBackgroundColor:[UIColor whiteColor]];
    [cell addSubview:label];
    [cell setBackgroundColor:[UIColor blackColor]];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section
{
    return @"title for header";
}

- (NSString *)tableView:(UITableView *)tableView
titleForFooterInSection:(NSInteger)section
{
    return @"title for footer";
}

- (BOOL)tableView:(UITableView *)tableView
canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (BOOL)tableView:(UITableView *)tableView
canMoveRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return YES;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.indexList;
}

- (NSInteger)tableView:(UITableView *)tableView
sectionForSectionIndexTitle:(NSString *)title
               atIndex:(NSInteger)index
{
    NSInteger count = 0;
    NSLog(@"%@ - %ld", title, (long)index);
    for (NSString *charcter in self.indexList) {
        if ([charcter isEqualToString:title]) {
            return count;
        }
        count++;
    }
    return 0;
}

- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)tableView:(UITableView *)tableView
moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
      toIndexPath:(NSIndexPath *)destinationIndexPath
{
    
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
