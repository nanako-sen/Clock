//
//  ClockViewController.h
//  Clock
//
//  Created by Sen on 19/04/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface ClockViewController : NSView {
	NSTimer* timer;
	
}
@property int firstHour;
@property int secondHour;
@property int firstMinute;
@property int secondMinute;
//@property int counter;
//@property int randomInt;
//@property int *randomNoArray;


- (void)currentTimeParts;
- (NSTimer*)createTimer;
- (void)timerTicked:(NSTimer*)timer;
//- (int*)RandomInt:(int)size;
//- (BOOL)isUniqueIn:(int*)randomArray withSize:(int)size forInt:(int)randomInt;
//- (int)generateRandomBetween:(int)smallNumber and:(int)bigNumber ;
@end


