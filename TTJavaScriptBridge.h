//
//  SKJavaScriptBridge.h
//  Tarantula
//
//  Created by Tom de Grunt on 9/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface TTJavaScriptBridge : NSObject {
	WebScriptObject *scriptObject;
}

// (NSString *)toString:(id)obj;
@property (nonatomic, retain) WebScriptObject *scriptObject;


@end
