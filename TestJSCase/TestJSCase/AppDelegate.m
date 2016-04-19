//
//  AppDelegate.m
//  TestJSCase
//
//  Created by chiery on 16/4/15.
//  Copyright © 2016年 My-Zone. All rights reserved.
//

#import "AppDelegate.h"
#import "TestProtocol.h"
#import "JPEngine.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [JPEngine startEngine];
    NSArray *arrayJSFiles = [[NSBundle mainBundle] pathsForResourcesOfType:@"js" inDirectory:nil];
    NSMutableString *patchString = [NSMutableString string];
    for (NSString *jsFilePath in arrayJSFiles){
        NSError *error;
        NSString *curPatch = [NSString stringWithContentsOfFile:jsFilePath encoding:NSUTF8StringEncoding error:&error];
        if ([curPatch length] && ([curPatch hasPrefix:@"defineClass"]||[curPatch hasPrefix:@"require"])) {
            [patchString appendString:curPatch];
            [patchString appendString:@"\n"];
        }
    }
    if ([patchString length]) {
        JSValue *value = [JPEngine evaluateScript:patchString];
        if (value) {
            NSLog(@"执行了补丁");
        }
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
