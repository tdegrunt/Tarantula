//
//  WebScriptObject+TTAdditions.m
//  Tarantula
//
//  Created by Tom de Grunt on 9/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "WebScriptObject+TTAdditions.h"


@implementation WebScriptObject (TTAdditions)

- (BOOL)hasProperty:(NSString *)s {
    return [[self callWebScriptMethod:@"hasOwnProperty" withArguments:[NSArray arrayWithObject:s]] boolValue];
}


- (id)propertyValueForKey:(NSString *)s {
    if ([self hasProperty:s]) {
        return [self valueForKey:s];
    } else {
        return nil;
    }
}

@end
