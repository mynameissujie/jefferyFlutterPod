//
//  MyFlutterViewController.m
//  tetetetete
//
//  Created by servyou group on 2019/3/7.
//  Copyright © 2019年 MAC. All rights reserved.
//

#import "MyFlutterViewController.h"

@interface MyFlutterViewController ()<FlutterStreamHandler>
@property (nonatomic, copy)FlutterEventSink eventSink;

@end

@implementation MyFlutterViewController

- (void)dealloc{
    NSLog(@"dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"flutter-test";
    self.navigationItem.title = @"FLUTTER";
    [self setInitialRoute:@"myAPP"];
    __weak typeof(self) weakSelf = self;
    NSString *channelName = @"popToRoot";
    FlutterMethodChannel *messageChannel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:self];
    [messageChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        NSLog(@"method=%@ arguments=%@",call.method,call.arguments);
        if ([call.method isEqualToString:@"pop"]) {
            NSDictionary *dict = @{@"name":@"ios",
                                   @"age":@"20"
                                   };
            __strong typeof(self) strongSelf = weakSelf;
            strongSelf.eventSink([strongSelf convertToJsonData:dict]);
        }
    }];
    
    FlutterEventChannel *eventChannel = [FlutterEventChannel eventChannelWithName:@"eventChannelName" binaryMessenger:self];
    [eventChannel setStreamHandler:self];
}

-(FlutterError *_Nullable)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)events{
    if (events) {
        self.eventSink = events;
//        events(@"这是传值给flutter的值");
        
    }
    return nil;
}


/// flutter不再接收
- (FlutterError* _Nullable)onCancelWithArguments:(id _Nullable)arguments {
    // arguments flutter给native的参数
    NSLog(@"%@", arguments);
    self.eventSink = nil;
    return nil;
}

-(NSString *)convertToJsonData:(NSDictionary *)dict

{
    
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *jsonString;
    
    if (!jsonData) {
        
        NSLog(@"%@",error);
        
    }else{
        
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        
    }
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
    NSRange range = {0,jsonString.length};
    
    //去掉字符串中的空格
    
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    return mutStr;
    
}
@end
