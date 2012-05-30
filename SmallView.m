//
//  SmallView.m
//  Clock
//
//  Created by Sen on 28/04/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "SmallView.h"


@implementation SmallView


@synthesize color;



- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
		//color = [[self createRandomColor]retain];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    // Drawing code here.
	
	[color set];
	NSRectFill(dirtyRect);
	NSLog(@"testse");
}



- (void)dealloc {
//	[randomNoArray release];
	[super dealloc];
}
	
@end
