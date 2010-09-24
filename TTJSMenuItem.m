//
//  TTJSMenuItem.m
//  Tarantula
//
//  Created by Tom de Grunt on 9/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TTJSMenuItem.h"


@implementation TTJSMenuItem

@synthesize function;

- (id)initWithTitle:(NSString *)aString function:(WebScriptObject *)aFunction keyEquivalent:(NSString *)charCode {

    if (self = [super initWithTitle:aString action:@selector(doJSAction:) keyEquivalent:charCode]) {
		self.function = aFunction;
		[self setTarget: self];
    }
    return self;
}

- (void)dealloc {
    [super dealloc];
}

- (void)doJSAction:(id)aSender {
	[self.function callWebScriptMethod:@"apply" withArguments:nil];
}

@end
