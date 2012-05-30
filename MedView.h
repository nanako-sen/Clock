//
//  MedView.h
//  Clock
//
//  Created by Sen on 20/04/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MedView : NSView {
	
}
//@property NSSize size;
@property (retain) NSColor *color;
@property int counter;
//@property int randomInt;
//@property int *randomNoArray;

//- (void)generateArrayWithRandomInts:(int)size;
//- (BOOL)isUniqueIn:(int*)randomArray;
//- (void)shuffleArray:(int*)array;
- (id)createRandomColor;
- (float)generateRandomBetween:(float)smallNumber and:(float)bigNumber;

@end
