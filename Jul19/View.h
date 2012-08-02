//
//  View.h
//  Jul19
//
//  Created by Lino Guglielmo on 7/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@class ViewController;

@interface View: UITextView {
	ViewController *viewController;
	UIImageView *spaceman;
	UIImageView *flames;
	UIImageView *planets;
	}

- (id) initWithFrame: (CGRect) frame controller: (ViewController *) c;
-(void) movespaceman;
-(void) launch;
-(void) reset;

@end