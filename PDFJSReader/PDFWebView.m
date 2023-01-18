//
//  PDFWebView.m
//  PDFJSReader
//
//  Created by lilu on 2017/5/12.
//  Copyright © 2017年 lilu. All rights reserved.
//

#import "PDFWebView.h"

@interface PDFWebView ()
//@property(nonatomic, strong) NSURL *filePath;
@end

@implementation PDFWebView


- (void)loadPDFFile:(NSURL*)filePath;
{
    _filePath = filePath;
    
    //方案1：初始化webView时候读取
    NSString *viwerPath = [[NSBundle mainBundle] pathForResource:@"viewer" ofType:@"html" inDirectory:@"minified/web"];
    NSString *urlStr = [NSString stringWithFormat:@"file://%@?file=%@#page=1",viwerPath,filePath];
    urlStr = [urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    [self loadRequest:request];
    
    
    
    
//    //方案2：bytes方式动态加载读取
//    NSString *viwerPath = [[NSBundle mainBundle] pathForResource:@"viewer" ofType:@"html" inDirectory:@"generic/web"];
//    NSURL * viwerPathURL = [NSURL fileURLWithPath:viwerPath];
//    NSURL * dir = viwerPathURL.URLByDeletingLastPathComponent;
//    [self loadFileURL:viwerPathURL allowingReadAccessToURL:dir];
//
//    //动态加载的写法
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        NSData *data = [NSData dataWithContentsOfURL:filePath];
//        NSUInteger len = [data length];
//        uint8_t myArray[len];
//        [data getBytes:&myArray length:len];
//
//        NSMutableArray<NSString *> *bytes = [NSMutableArray array];
//        const uint8_t *rawBytes = data.bytes;
//        for (NSUInteger i = 0; i < data.length; i++) {
//            [bytes addObject:[NSString stringWithFormat:@"%d", (int)rawBytes[i]]];
//        }
//
//        NSString *javaScriptArray = [bytes componentsJoinedByString:@","];
//
//        NSString *strForEvaluate = [NSString stringWithFormat:
//                                    @"PDFViewerApplication.open(new Uint8Array([%@]));", javaScriptArray];
//
//        [self evaluateJavaScript:strForEvaluate completionHandler:^(id Result, NSError * _Nullable error) {
//            if (error)
//            {
//                NSLog(@"This is error....%@",error.description);
//            }
//            else if(Result)
//            {
//                NSLog(@"+++%@",Result);
//            }
//        }];
//
//    });
}
@end
