//
//  SideMenuViewController.h
//  FlytPath
//
//  Created by Erik Bye on 2/5/15.
//  Copyright (c) 2015 Erik Bye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import "DeveloperWebsiteViewController.h"

@interface SideMenuViewController : UIViewController <MFMailComposeViewControllerDelegate>

-(IBAction)goBack:(id)sender;
-(IBAction)website:(id)sender;
@end
