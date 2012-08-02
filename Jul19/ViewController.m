//
//  ViewController.m
//  Jul19
//
//  Created by Lino Guglielmo on 7/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "Jul19AppDelegate.h"
#import "View.h"
#import "InfoController.h"
#import "InfoView.h"

@implementation ViewController

/*
 - (id) initWithNibName: (NSString *) nibNameOrNil bundle: (NSBundle *) nibBundleOrNil
 {
 self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
 if (self) {
 // Custom initialization
 }
 return self;
 }
 */


- (id) initWithTitle: (NSString *) title {
	self = [super initWithNibName: nil bundle: nil];
	if (self != nil) {
		// Custom initialization
		self.title = title;
		self.navigationItem.prompt =
		[NSString stringWithFormat: @"Welcome to Planet Navigation of %@", self.title];		
		
		self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle: @"Outer Planets"
																				  style: UIBarButtonItemStylePlain
																				 target: self
																				 action: @selector(nextStation)
												  ];
		
		NSBundle *bundle = [NSBundle mainBundle];
		NSLog(@"bundle.bundlePath == \"%@\"", bundle.bundlePath);	
		
		NSString *filename = [bundle pathForResource: @"spaceship" ofType: @"mp3"];
		NSLog(@"filename == \"%@\"", filename);
		
		NSURL *url = [NSURL fileURLWithPath: filename isDirectory: NO];
		NSLog(@"url == \"%@\"", url);
		
		OSStatus error = AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &sid);
		if (error != kAudioServicesNoError) {
			NSLog(@"AudioServicesCreateSystemSoundID error == %ld", error);
		}
	}
	return self;
}

- (void) nextStation {
	UIApplication *application = [UIApplication sharedApplication];
	Jul19AppDelegate *applicationDelegate = application.delegate;
	[applicationDelegate nextStation];
}


- (void) discover {
	
	//NSLog( @"Here");

	Jul19AppDelegate *applicationDelegate = [UIApplication sharedApplication].delegate ;
	NSString *information = [applicationDelegate.information objectForKey: self.title];
	
	InfoController *infoController = [[InfoController alloc]
									  initWithTitle: self.title
									  information: information 
									  ];
	
	//Create a navigation controller to make the infoController's navigation item
	//(containing the Done button) visible.
	UINavigationController *navigationController =
	[[UINavigationController alloc] initWithRootViewController: infoController];
	
	[self presentModalViewController: navigationController animated: YES];

}

- (void) playSound{
	// Override point for customization after application launch.

	AudioServicesPlaySystemSound(sid);	
		
	}	



- (void) didReceiveMemoryWarning
{
	// Releases the view if it doesn't have a superview.
	[super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void) loadView
{
	CGRect frame = [UIScreen mainScreen].applicationFrame;
	self.view = [[View alloc] initWithFrame: frame controller: self];
}


/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void) viewDidLoad
 {
 [super viewDidLoad];
 }
 */

- (void) viewDidUnload
{
	[super viewDidUnload];
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (BOOL) shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation) interfaceOrientation
{
	// Return YES for supported orientations
	//return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
	//return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);	
	//return (interfaceOrientation == UIInterfaceOrientationPortrait);
	return YES;
}

@end