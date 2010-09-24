//
//  WebScriptObject+TTAdditions.h
//  Tarantula
//
//  Created by Tom de Grunt on 9/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface WebScriptObject (TTAdditions)
- (BOOL)hasProperty:(NSString *)s;
- (id)propertyValueForKey:(NSString *)s;
@end
