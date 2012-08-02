//
//  ViewController.h
//  Jul19
//
//  Created by Lino Guglielmo on 7/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>	//needed for SystemSoundID
@interface ViewController: UIViewController{
	
	SystemSoundID sid;
}

- (id) initWithTitle: (NSString *) title;
- (void) nextStation;
- (void) discover;
- (void) playSound;

@end