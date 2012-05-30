//
//  MedView.m
//  Clock
//
//  Created by Sen on 20/04/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MedView.h"

@implementation MedView

@synthesize color;
@synthesize counter;
//@synthesize randomInt;
//@synthesize randomNoArray;

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
//		color = [[self createRandomColor]retain];
		
		//SmallView *smallView = [[SmallView alloc]initWithFrame:NSMakeRect(0,0, 20 ,20)];
//		[smallView generateArrayWithRandomInts:3];
		
		//[self addSubview:smallView];
		
//		[smallView release];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
	
	//[[NSColor redColor]set];
//	//[color set];
//	NSRectFill(dirtyRect);	
}

- (id)createRandomColor {
	float red, green, blue, alpha;
	red = [self generateRandomBetween:0 and:255] / 255;
	green = [self generateRandomBetween:0 and:255] / 255;
	blue = [self generateRandomBetween:0 and:255] / 255;
	alpha = 1;
	
	color = [NSColor colorWithCalibratedRed:red
									  green:green
									   blue:blue
									  alpha:alpha];
	NSLog(@"red %f | green %f | blue %f| alpha %f", red, green, blue, alpha);
	return color;
}

- (float)generateRandomBetween:(float)smallNumber and:(float)bigNumber {  
	float diff = bigNumber - smallNumber;
	float n = (((float) (arc4random() % ((unsigned)RAND_MAX + 1)) / RAND_MAX) * diff) + smallNumber;
	return n;
}

//- (void)generateArrayWithRandomInts:(int)size {
//	int randomArray[size];
//	
//	for(counter = 0; counter < size;) {
//		randomInt = [self generateRandomBetween:1 and:9];
//		if ([self isUniqueIn:randomArray]) {
//			randomArray[counter] = randomInt;
//			NSLog(@"ext random: %i",randomInt);
//		}
//	}	
//	
//	randomNoArray = randomArray;
//	NSLog(@"%i",randomArray[1]);
//	
//	//	[randomArray release];
//}
//
//- (BOOL)isUniqueIn:(int*)randomArray {
//	for(int i = 0; i <= sizeof(randomArray); i++) {
//		if (randomArray[i] == randomInt) {
//			return FALSE;
//		}
//	}
//	counter ++;
//	return TRUE;
//}
//
//- (void) shuffleArray:(int*)array {
//	int temporary, randomNum, last;
//	for (last = sizeof(array); last > 1; last--) {
//		
//		randomNum = rand( ) % last;
//		temporary = array[randomNum];
//		array[randomNum] = array[last - 1];
//		array[last - 1] = temporary;
//	}
//	for(int i = 0; i<=sizeof(array);i++){
//		NSLog(@"shuffled array: %i", array[i]);
//	}
//}


- (void)dealloc {
    [color release];
	[super dealloc];
}



@end
