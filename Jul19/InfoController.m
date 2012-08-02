//
//  InfoController.m
//  Jul19
//
//  Created by Lino Guglielmo on 7/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "InfoController.h"
#import "InfoView.h"

@implementation InfoController

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

- (id) initWithTitle: (NSString *) title information: (NSString *) i {
	self = [super initWithNibName: nil bundle: nil];
	if (self) {
		// Custom initialization
		self.title = title;
		
		self.navigationItem.rightBarButtonItem =
		[[UIBarButtonItem alloc] initWithTitle: @"Done"
										 style: UIBarButtonItemStylePlain
										target: self
										action: @selector(done)
		 ];
		information = i;
	}
	return self;
}

- (void) done {
	
	[self dismissModalViewControllerAnimated: YES];

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
	self.view = [[InfoView alloc] initWithFrame: frame information: information];
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
	//return (interfaceOrientation == UIInterfaceOrientationPortrait);
	return YES;
}

@end
