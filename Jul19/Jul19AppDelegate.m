//
//  Jul19AppDelegate.m
//  Jul19
//
//  Created by Lino Guglielmo on 7/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Jul19AppDelegate.h"
#import "ViewController.h"

@implementation Jul19AppDelegate
@synthesize window = _window;
@synthesize information;

- (BOOL) application: (UIApplication *) application didFinishLaunchingWithOptions: (NSDictionary *) launchOptions
{
	planets = [NSArray arrayWithObjects:
			 @"Sun",
			 @"Mercury",
			 @"Venus",
			 @"Earth",	
			 @"Mars",
			 @"Jupiter",
			 @"Saturn",
			 @"Uranus",
			 @"Neptune",
			 nil
			 ];

	information = [NSDictionary dictionaryWithObjectsAndKeys:
				   @"http://en.m.wikipedia.org/wiki/Sun",          @"Sun",
				   @"http://en.m.wikipedia.org/wiki/Mercury_(planet)",      @"Mercury",
				   @"http://en.m.wikipedia.org/wiki/Venus",        @"Venus",
				   @"http://en.m.wikipedia.org/wiki/Earth",        @"Earth",                        
				   @"http://en.m.wikipedia.org/wiki/Mars",         @"Mars",
				   @"http://en.m.wikipedia.org/wiki/Jupiter",      @"Jupiter",		 
				   @"http://en.m.wikipedia.org/wiki/Saturn",        @"Saturn",
				   @"http://en.m.wikipedia.org/wiki/Uranus",        @"Uranus",
				   @"http://en.m.wikipedia.org/wiki/Neptune",        @"Neptune",
				   nil
				   ];
	
	
	
	NSString *firstName = [planets objectAtIndex: 0];
	ViewController *firstController = [[ViewController alloc] initWithTitle: firstName];
	visited = [NSMutableArray arrayWithObject: firstController];
	
	self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
	// Override point for customization after application launch.
	
	self.window.rootViewController =
	[[UINavigationController alloc] initWithRootViewController: [visited objectAtIndex: 0]];
	
	[self.window makeKeyAndVisible];
	return YES;
}

//Called when user touches a View.

- (void) nextStation {
	
	UINavigationController *navigationController =
	(UINavigationController *)self.window.rootViewController;
	
	NSUInteger i = navigationController.viewControllers.count;
	if (i == planets.count) {
		//We are currently visiting the last station, and can go no further.
		return ;
	}
	
	if (visited.count <= i) {
		//This station is being visited for the first time.
		[visited addObject:
		 [[ViewController alloc] initWithTitle: [planets objectAtIndex: i]]
		 ];
	}
	
	[navigationController pushViewController: [visited objectAtIndex: i] animated: YES];

}








- (void) applicationWillResignActive: (UIApplication *) application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void) applicationDidEnterBackground: (UIApplication *) application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void) applicationWillEnterForeground: (UIApplication *) application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void) applicationDidBecomeActive: (UIApplication *) application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void) applicationWillTerminate: (UIApplication *) application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
