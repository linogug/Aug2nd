//
//  InfoView.m
//  Jul19
//
//  Created by Lino Guglielmo on 7/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import "InfoView.h"

@implementation InfoView

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

- (id) initWithFrame: (CGRect) frame information: (NSString *) information
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor yellowColor];
	//	self = [UIFont systemFontOfSize: 24];
	//	self.text = information;
	//	self.editable = NO;
		
		
		self.scalesPageToFit = YES;
		
		NSURL *webUrl = [NSURL URLWithString: information];
		NSData *data = [NSData dataWithContentsOfURL: webUrl];
		
		if (data == nil) {
			NSLog(@"could not load URL %@", webUrl);
				return self;
			}
		[self loadData: data MIMEType: @"text/html" textEncodingName: @"NSUTF8StringEncoding" baseURL: webUrl];		
		
		[self.window makeKeyAndVisible];
	}
	return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void) drawRect: (CGRect) rect
 {
 // Drawing code
 }
 */

@end
