//
//  ClockViewController.m
//  Clock
//
//  Created by Sen on 19/04/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "ClockViewController.h"
#import "MedView.h"
#import "SmallView.h"

int *RandomInt(int size);
int generateRandomBetween(int smallNumber, int bigNumber);
int isUniqueIn(int *randomArray, int size, int randomInt);
int intcmp(const void *aa, const void *bb);
id refToSelf;

int *RandomInt(int size) {
	
	//NSLog(@"size: %i",size);
	int randomArray[size];
	int *ra;
	int randomInt;
	for(int counter = 0; counter < size;) {
		randomInt = generateRandomBetween(1,9);
		//		if ([refToSelf isUniqueIn:randomArray withSize:size forInt:randomInt]) {
		
		if (isUniqueIn(randomArray, size, randomInt) == 1) {
			counter ++;
			randomArray[counter-1] = randomInt;
			
			
		}
		
	}	
	
	for(int e = 0; e<size; e++){
		
		//NSLog(@"ext random: %i",randomArray[e]);
	}
	
	qsort(&randomArray[0], size, sizeof(int), intcmp);
	ra = &randomArray[0];
	//NSLog(@"XX: %i", *(ra+1));	
	//	[randomArray release];
	return ra;
}

int intcmp(const void *aa, const void *bb)
{
    const int *a = aa, *b = bb;
    return (*a < *b) ? -1 : (*a > *b);
}

int generateRandomBetween(int smallNumber, int bigNumber) {  
	int diff = bigNumber - smallNumber;
	int n = (((float) (arc4random() % ((unsigned)RAND_MAX + 1)) / RAND_MAX) * diff) + smallNumber;
	return n;
}

int isUniqueIn(int *randomArray, int size, int randomInt){
	//	NSLog(@"ss %i",sizeof(randomArray));
	for(int i = 0; i < size; i++) {
		//NSLog(@"we %i",randomArray[i]);
		if (*(randomArray+i) == randomInt) {
			return 0;
		}
	}
	
	return 1;
}



@implementation ClockViewController

@synthesize firstHour;
@synthesize secondHour;
@synthesize firstMinute;
@synthesize secondMinute;

//@synthesize counter;
//@synthesize randomInt;
//@synthesize randomNoArray;

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setToolTip:@"hour "];

        [self addViews];
        
        [self createTimer];
    }
	


	
    return self;
}


- (void)drawRect:(NSRect)dirtyRect {
	[[NSColor grayColor]set];
	NSRectFill(dirtyRect);
	
}

- (void)addViews{
    NSLog(@"-------------------------");
    NSSize	size = [self bounds].size;
    
    int nrOfRect = 4;
    int dimension = 150;
    int margin = 50;
    
    
    float y = size.height / 2 - dimension / 2;
    float x = (size.width / 2 - ((dimension + margin) * nrOfRect - margin) / 2) ;
    
    int noOfSmallRect = 9;
    int dimensionSmall = 40;
    int marginSmall = (dimension - (dimensionSmall*3)) / (3 - 1);
    
    [self currentTimeParts];
    
    NSLog(@" hour %i%i | minute %i%i", firstHour, secondHour, firstMinute, secondMinute );
        //		[firstHour release];
    //		[secondHour release];
    
    for(int i = 1; i<= nrOfRect; i++){
        
        MedView* medv = [[MedView alloc]initWithFrame:NSMakeRect(x,y, dimension, dimension)];
        
        
        //			SmallView *smallView = [[SmallView alloc]initWithFrame:NSMakeRect(0,0, 20 ,20)];
        //			int array[9] = { 1,2,3,4,5,6,7,8,9};
        
        int xs;
        int ys = 0;
        int rowCounter = 0;
        int row = 1;
        int *randomNoArray;
        int time;
        switch (i) {
            case 1:
                randomNoArray = RandomInt(firstHour);	
                time = firstHour;
                break;
            case 2:
                randomNoArray = RandomInt(secondHour);
                time = secondHour;
                break;
            case 3:
                randomNoArray = RandomInt(firstMinute);
                time = firstMinute;
                break;
            case 4:
                randomNoArray = RandomInt(secondMinute);
                time = secondMinute;
                break;
            default:
                break;
        }
        
        int arr[time];
        for(int y = 0; y<time; y++){
            arr[y] = *(randomNoArray+y);
            //NSLog(@"sort: %i", arr[y]);
        }
        
        //NSLog(@"array: %i", arr[0]);
        
        for(int c = 0; c < noOfSmallRect; c++) {				
            if (c != 0  && c % 3 == 0) {
                rowCounter = 0;
                ys = (dimensionSmall + marginSmall) * (row);
                row++;
            }
            xs = (dimensionSmall + marginSmall) * rowCounter;
            
            rowCounter++;
            
            SmallView *smallView = [[SmallView alloc]initWithFrame:NSMakeRect(xs,ys, dimensionSmall,dimensionSmall)];
            NSLog(@"time: %i", time);
            [smallView setNeedsDisplay:YES];
            
            for(int k = 0; k < time; k++) {
                //if (i == 3) NSLog(@"array: %i", arr[k]);
                if (arr[k] == c) {
                    smallView.color = [smallView createRandomColor];
                    [medv addSubview:smallView];
                }else {
                    //smallView.color = [NSColor blackColor];
                }
                //[medv addSubview:smallView];
                //[smallView release];
            }
            [medv addSubview:smallView];
            [smallView release];
            
            
        }
        
        NSLog(@"--");
        
        
        
        x = x + dimension + margin;
        [self addSubview:medv];
        [medv release];
    }
    
}

//- (BOOL)isUniqueIn:(int[])randomArray withSize:(int)size forInt:(int)randomInt{
////	NSLog(@"ss %i",sizeof(randomArray));
//	for(int i = 0; i < size; i++) {
//		//NSLog(@"we %i",randomArray[i]);
//		if (randomArray[i] == randomInt) {
//			return FALSE;
//		}
//	}
//	
//	return TRUE;
//}

//- (int)generateRandomBetween:(int)smallNumber and:(int)bigNumber {  
//	int diff = bigNumber - smallNumber;
//	int n = (((float) (arc4random() % ((unsigned)RAND_MAX + 1)) / RAND_MAX) * diff) + smallNumber;
//	return n;
//}


- (void)currentTimeParts{
	
	CFGregorianDate currentDate = CFAbsoluteTimeGetGregorianDate(CFAbsoluteTimeGetCurrent(), CFTimeZoneCopySystem());
	NSLog(@"date: %d", currentDate.hour);
	NSString *hours = [NSString stringWithFormat:@"%02d", currentDate.hour];
	NSString *minutes = [NSString stringWithFormat:@"%02d", currentDate.minute];
	firstHour = [[hours substringToIndex:1] intValue];
	secondHour = [[hours substringFromIndex:1] intValue];
	firstMinute = [[minutes substringToIndex:1] intValue];
	secondMinute = [[minutes substringFromIndex:1] intValue];
	[hours release];
	[minutes release];
}

- (NSTimer*)createTimer {
	
    // create timer on run loop
    return [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(timerTicked:) userInfo:nil repeats:YES];
}

- (void)timerTicked:(NSTimer*)timer {
	
    // decrement timer 1 … this is your UI, tick down and redraw
    [self setNeedsDisplay:YES];
    [self addViews];
}

- (void)dealloc {
	//	[firstHour release];
	//	[secondHour release];
	//	[firstMinute release];
	//	[secondMinute release];
	[super dealloc];
}

@end

