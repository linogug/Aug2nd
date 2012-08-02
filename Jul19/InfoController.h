//
//  InfoController.h
//  Jul19
//
//  Created by Lino Guglielmo on 7/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoController: UIViewController {
	NSString *information;
	UIView *myview;
}

- (id) initWithTitle: (NSString *) title information: (NSString *) i;
@end

