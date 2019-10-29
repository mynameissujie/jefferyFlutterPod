//
//  JAppDelegate.h
//  jefferyFlutterPod
//
//  Created by mynameissujie on 10/29/2019.
//  Copyright (c) 2019 mynameissujie. All rights reserved.
//

@import UIKit;


#import <Flutter/Flutter.h>

@interface JAppDelegate : FlutterAppDelegate <UIApplicationDelegate,FlutterAppLifeCycleProvider>

@property (nonatomic,strong) FlutterEngine *flutterEngine;

@end
