//
//  ViewController.m
//  本地通知Test
//
//  Created by Haoran Liu on 16/11/5.
//  Copyright © 2016年 HanRan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIMutableUserNotificationAction *action1 = [[UIMutableUserNotificationAction alloc] init];
    action1.identifier = @"动作1";
    action1.title = @"确认选择";
//    action1.behavior = UIUserNotificationActionBehaviorDefault;
    action1.activationMode = UIUserNotificationActivationModeForeground;
    [action1 setDestructive:NO];
    [action1 setAuthenticationRequired:NO];
    
    UIMutableUserNotificationAction *action2 = [[UIMutableUserNotificationAction alloc] init];
    action2.identifier = @"动作2";
    action2.title = @"删除";
    action2.activationMode = UIUserNotificationActivationModeForeground;
    [action2 setDestructive:YES];
    [action2 setAuthenticationRequired:NO];
    
    UIMutableUserNotificationAction *action3 = [[UIMutableUserNotificationAction alloc] init];
    action3.identifier = @"动作3";
    action3.title = @"添加";
    action3.activationMode = UIUserNotificationActivationModeForeground;
    [action3 setDestructive:YES];
    [action3 setAuthenticationRequired:NO];

    
    UIMutableUserNotificationCategory *category1 = [[UIMutableUserNotificationCategory alloc] init];
    category1.identifier = @"策略1";
    [category1 setActions:@[action1, action2] forContext:UIUserNotificationActionContextDefault];
    
    UIMutableUserNotificationCategory *category2 = [[UIMutableUserNotificationCategory alloc] init];
    category2.identifier = @"策略2";
    [category2 setActions:@[action3] forContext:UIUserNotificationActionContextDefault];
    
    
    
    NSSet *categories = [[NSSet alloc] initWithObjects:category1, category2, nil];
    
    UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound categories:categories];
    
    [[UIApplication sharedApplication] registerUserNotificationSettings: setting];
    
}

- (IBAction)sendMessage:(id)sender {
    
    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.alertTitle = @"发送通知";
    note.alertBody = @"发送通知成功";
    note.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
//    note.repeatInterval = NSCalendarUnitMinute;
    note.category = @"策略2";
    
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
    
}







@end
