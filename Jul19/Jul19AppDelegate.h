//
//  Jul19AppDelegate.h
//  Jul19
//
//  Created by Lino Guglielmo on 7/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import <UIKit/UIKit.h>


@interface Jul19AppDelegate: UIResponder <UIApplicationDelegate> {
	UIWindow *_window;
	NSArray *planets;
	NSMutableArray *visited;
	
}

- (void) nextStation;


@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSDictionary *information;
@end

