//
//  SKJavaScriptBridge.m
//  Tarantula
//
//  Created by Tom de Grunt on 9/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TTJavaScriptBridge.h"
#import "WebScriptObject+TTAdditions.h"
#import "TTJSMenuItem.h"

@interface NSApplication (NiblessAdditions)
-(void) setAppleMenu:(NSMenu *)aMenu;
@end

@implementation TTJavaScriptBridge

@synthesize scriptObject;

- (id)init {
    if (self = [super init]) {
    }
    return self;
}

- (void)dealloc {
    [super dealloc];
}

- (NSString *)description {
    return @"[object Tarantula]";
}

#pragma mark -
#pragma mark WebScripting

+ (NSString *)webScriptNameForKey:(const char *)name {
    if (0 == strcmp(name, "dockBadge")) {
        return @"dockBadge";
    } else if (0 == strcmp(name, "isGrowlRunning")) {
        return @"isGrowlRunning";
    } else {
        return nil;
    }
}


+ (NSString *)webScriptNameForSelector:(SEL)sel {
    if (@selector(beep) == sel) {
        return @"beep";
    } else if (@selector(openPanel) == sel) {
        return @"openPanel";
    } else if (@selector(setApplicationMenu:) == sel) {
        return @"setApplicationMenu";
    } else if (@selector(terminateFromJS) == sel) {
        return @"terminate";
    } else {
        return nil;
    }
}


+ (BOOL)isKeyExcludedFromWebScript:(const char *)name {
    return (nil == [self webScriptNameForKey:name]);
}


+ (BOOL)isSelectorExcludedFromWebScript:(SEL)sel {
    return (nil == [self webScriptNameForSelector:sel]);
}

#pragma mark -
#pragma mark JavaScript Actions

- (void)terminateFromJS {
    [NSApp terminate:self];
}

- (void)beep {
    NSBeep();
}

- (id)openPanel {
	
	NSOpenPanel *openPanel = [NSOpenPanel openPanel];
    NSInteger result = [openPanel runModal];
	
    NSMutableString * resultObject = [NSMutableString stringWithFormat:@"({ button:%d, URLs:", result];
	
    NSMutableArray * fileSystemURLs = [NSMutableArray array];
	
    for (NSURL * URL in [openPanel URLs])
        [fileSystemURLs addObject:[URL absoluteURL]];
	
    if (result == NSFileHandlingPanelOKButton)
        [resultObject appendString:[NSString stringWithFormat:@"[\"%@\"] })", [fileSystemURLs componentsJoinedByString:@"\", \""]]];
	
    else
        [resultObject appendString:@"[] })"];
	
    return [scriptObject evaluateWebScript:resultObject];
}

- (void)setApplicationMenu: (WebScriptObject *)wso {
	 NSMenu      *menu;
	 NSMenuItem  *menuItem;	
	 
	[[NSApp mainMenu] removeAllItems];
	 
	 for( int i = 0; i < [[wso valueForKey:@"length"] unsignedIntegerValue]; i++ ) {
		 WebScriptObject *wsoMenu = [wso webScriptValueAtIndex:i];
	 
		 if( i == 0 ) {
			 menu = [[NSMenu alloc] initWithTitle:@""];
		 } else {
			 menu = [[NSMenu alloc] initWithTitle:[wsoMenu propertyValueForKey:@"title"]];
		 }
	 
		 WebScriptObject *wsoMenuItems = (WebScriptObject *)[wsoMenu propertyValueForKey:@"items"];
		 NSLog(@"items: %@", [wsoMenu propertyValueForKey:@"items"]);
		 for( int j = 0; j < [[wsoMenuItems valueForKey:@"length"] unsignedIntegerValue]; j++ ) {
			 WebScriptObject *wsoMenuItem = [wsoMenuItems webScriptValueAtIndex:j];
			 
			 menuItem = [[TTJSMenuItem alloc] initWithTitle:[wsoMenuItem propertyValueForKey:@"title"] 
												   function:[wsoMenuItem propertyValueForKey:@"action"] 
											keyEquivalent:[wsoMenuItem propertyValueForKey:@"keyEquivalent"]];
						 			 
			 [menu addItem:menuItem];
			 [menuItem release];
		 }
	 
		 if (i==0) {
			 menuItem = [[NSMenuItem alloc] initWithTitle:@"Apple" action:nil keyEquivalent:@""];
		 } else {
			 menuItem = [[[NSMenuItem alloc] initWithTitle:[wsoMenu propertyValueForKey:@"title"] action:nil keyEquivalent:@""] autorelease];
		 }
	 
		 [menuItem setSubmenu:menu];
		 [[NSApp mainMenu] addItem:menuItem];
		 if(i == 0) {
			 [NSApp setAppleMenu:menu];
		 }
	 }
	 
}

@end
