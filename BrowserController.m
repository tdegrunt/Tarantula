//
//  BrowserController.m
//  Tarantula
//
//  Created by Tom de Grunt on 9/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BrowserController.h"


@implementation BrowserController

@synthesize myWebView;
@synthesize javaScriptBridge;

- (id)init {
	self = [super init];
	if (self) {
		self.javaScriptBridge = [[[TTJavaScriptBridge alloc] init] autorelease];
	}
    return self;
}

-(void)awakeFromNib {	
	NSString *initialResource = @"Application/index.html";
    NSString *initialURL = [[NSString stringWithFormat:@"file://%@/%@", [[NSBundle mainBundle] resourcePath], initialResource] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	
	[[myWebView mainFrame] loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:initialURL]]];
	
	javaScriptBridge.scriptObject = [myWebView windowScriptObject];
	
	[[myWebView windowScriptObject] setValue:javaScriptBridge forKey:@"tarantula"];
	[[myWebView windowScriptObject] setValue:self forKey:@"console"];	
}

#pragma mark -
#pragma mark WebScripting

+ (NSString *)webScriptNameForKey:(const char *)name {
	return nil;
}


+ (NSString *)webScriptNameForSelector:(SEL)sel {
    if (@selector(log:) == sel) {
        return @"log";
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
#pragma mark Javascript Actions

- (void) log:(NSString*) theMessage {
	NSLog(@"%@", theMessage );
}



@end
