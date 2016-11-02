//
//  AppDelegate.m
//  SDKTest
//
//  Created by Kamil Kocemba on 02/11/2016.
//  Copyright © 2016 test. All rights reserved.
//

#import "AppDelegate.h"
#import <AdobeMobileSDK/ADBMobile.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    NSString *configurationPath = [[NSBundle mainBundle] pathForResource:@"adobe-development" ofType:@"json"];
    [ADBMobile overrideConfigPath:configurationPath];
    
    [ADBMobile setDebugLogging:YES];
    [ADBMobile setAppGroup:@"group.sdk.test"];
    [ADBMobile collectLifecycleData];
    
    [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:YES block:^(NSTimer *timer) {
        [ADBMobile trackAction:@"TEST" data:nil];
        [ADBMobile trackingClearQueue];
    }];
    return YES;
}

@end
