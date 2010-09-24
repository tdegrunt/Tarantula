//
//  TTJSMenuItem.h
//  Tarantula
//
//  Created by Tom de Grunt on 9/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface TTJSMenuItem : NSMenuItem {
	WebScriptObject *function;
}

@property (nonatomic, retain) WebScriptObject *function;

- (id)initWithTitle:(NSString *)aString function:(WebScriptObject *)aFunction keyEquivalent:(NSString *)charCode;

@end
