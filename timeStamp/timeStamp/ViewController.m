//
//  ViewController.m
//  timeStamp
//
//  Created by nieyu on 7/7/15.
//  Copyright (c) 2015 YuNie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    NSDate *date = [dateFormatter dateFromString:@"2015-06-26 16:49:44"];
//    NSTimeZone *zone = [NSTimeZone localTimeZone];
//    NSInteger interval = [zone secondsFromGMTForDate:date];
//    NSDate *localeDate = [date dateByAddingTimeInterval:interval];
    NSTimeInterval timeInterval = [date timeIntervalSince1970];
    NSString *stringtime = [NSString stringWithFormat:@"%.0lf", timeInterval];
    NSLog(@"%@", [NSString stringWithFormat:@"%.0lf", timeInterval]);
    
    NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
    [dateFormatter1 setDateFormat:@"HH:mm:ss"];

    NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSString *time = [dateFormatter1 stringFromDate:date1];
    NSLog(@"%@", time);
    
    
    NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc] init];
    [dateFormatter2 setDateFormat:@"yyyy-MM-dd"];
    NSTimeInterval timeInterval2 = stringtime.doubleValue;
    NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:timeInterval2];
    NSString *dateStand = [dateFormatter2 stringFromDate:date2];
    NSDate *dateStandBack = [dateFormatter2 dateFromString:dateStand];
    NSTimeInterval timeStampStart = [dateStandBack timeIntervalSince1970];
    NSLog(@"%@",[NSString stringWithFormat:@"%.0lf",timeStampStart]);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
