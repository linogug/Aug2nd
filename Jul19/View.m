//
//  View.m
//  Jul19
//
//  Created by Lino Guglielmo on 7/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "View.h"
#import "ViewController.h"

@implementation View

/*
 - (id) initWithFrame: (CGRect) frame
 {
 self = [super initWithFrame: frame];
 if (self) {
 // Initialization code
 }
 return self;
 }
 */

- (id) initWithFrame: (CGRect) frame controller: (ViewController *) c
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor clearColor];
		self.font = [UIFont fontWithName: @"Courier" size: 20];
		self.editable = NO;
		viewController = c;
		
		
		//add gesture recognizers
		UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc]
												initWithTarget: self action: @selector(swipe:)
												];
		recognizer.direction = UISwipeGestureRecognizerDirectionRight;
		[self addGestureRecognizer: recognizer];
		
		recognizer = [[UISwipeGestureRecognizer alloc]
					  initWithTarget: self action: @selector(swipe:)
					  ];
		recognizer.direction = UISwipeGestureRecognizerDirectionLeft;
		[self addGestureRecognizer: recognizer];		
		
		//add button
		UIButton *button = [UIButton buttonWithType: UIButtonTypeRoundedRect];
		
		
		
		NSString *title = [@"Visit " stringByAppendingString: [viewController title]];
		[button setTitle: title forState: UIControlStateNormal];
		CGSize s = [title sizeWithFont: button.titleLabel.font];
		button.frame = CGRectMake(0, 0, s.width + 20, s.height + 10);
		
		//Put center of button at origin of StationView.
		button.center = CGPointMake ((self.bounds.size.height)/2, (self.bounds.size.height)/2-35);
		
		[button addTarget: self
				   action: @selector(launch)
		 forControlEvents: UIControlEventTouchUpInside
		 ];
		
		
		// add planets
		NSString *test = [[viewController title] stringByAppendingString: @".jpeg"];
		
		planets = [[UIImageView alloc] initWithImage:[UIImage imageNamed:test] ];	
		
		planets.transform = CGAffineTransformMakeTranslation(self.bounds.origin.x,self.bounds.origin.y);
		
		//add spaceman
		spaceman = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"spaceman.png"] ];	
		
		// add flames
		flames = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rocflames.png"] ];
		
		//reset spaceship
		[self reset];	
		
		// add views
		[self addSubview:planets];		
		[self addSubview: button];
		[self addSubview:flames];	
		[self addSubview:spaceman];	
		
		
	}
	return self;
}


- (void) movespaceman {
	
	NSLog(@"here");	
		
}

- (void) touchesEnded: (NSSet *) touches withEvent: 	
(UIEvent *) event {
			
	//[viewController nextStation];
	
}


- (void) swipe: (UISwipeGestureRecognizer *) recognizer {
	
	
	
	if (recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
		[self launch];		
	} else if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
		[self reset];
		
	} else if (recognizer.direction == UISwipeGestureRecognizerDirectionUp) {
	//	direction = @"↑";
	} else if (recognizer.direction == UISwipeGestureRecognizerDirectionDown) {
	//	direction = @"↓";
	}
	
	
}

- (void) launch{
	
	[viewController playSound];		
	
	[UIView animateWithDuration: 2.0
							  delay: 1.0
							options: UIViewAnimationOptionCurveEaseInOut
						 animations: ^{
							 //This block describes what the animation should do.
							 spaceman.transform = CGAffineTransformMakeTranslation(200,self.frame.size.width/8);
							 flames.transform = CGAffineTransformMakeTranslation(130,self.frame.size.width/8);							 
						 }
						 completion: ^(BOOL b) {
							 [UIView animateWithDuration: 1.0
												   delay: 0.0
												 options: UIViewAnimationOptionCurveLinear
											  animations: ^{
												  //This block describes what the animation should do.
												  [viewController discover]	;
											  }
											  completion: NULL
							  ];
						 }
		 ];	
	
}

- (void) reset {
	
	//[viewController playSound];	
	spaceman.transform = CGAffineTransformMakeTranslation(70,self.frame.size.width/8);
	flames.transform = CGAffineTransformMakeTranslation(0,self.frame.size.width/8);	
	
	
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void) drawRect: (CGRect) rect
{
	;
}	
	
@end