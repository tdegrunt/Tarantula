//
//  BrowserController.h
//  Tarantula
//
//  Created by Tom de Grunt on 9/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>
#import "TTJavaScriptBridge.h"

@interface BrowserController : NSObject {
	WebView *myWebView;
	TTJavaScriptBridge *javaScriptBridge;
}

@property(assign) IBOutlet WebView *myWebView;
@property (nonatomic, retain) TTJavaScriptBridge *javaScriptBridge;

@end
