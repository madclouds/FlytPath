//
//  SideMenuViewController.m
//  FlytPath
//
//  Created by Erik Bye on 2/5/15.
//  Copyright (c) 2015 Erik Bye. All rights reserved.
//

#import "SideMenuViewController.h"

@interface SideMenuViewController ()
{
MFMailComposeViewController *mailViewController;
}
@end

@implementation SideMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

-(IBAction)reviewApp:(id)sender{
    
    NSString* stringURL = [NSString stringWithFormat:@"%@%@%@", REVIEW_URL_PART_1, APP_ID, REVIEW_URL_PART_2];
    NSURL *url = [NSURL URLWithString:stringURL];
    [[UIApplication sharedApplication] openURL:url];
}

-(IBAction)website:(id)sender{
    
  //Show webviewcontroller slide in from somewhere.
//    or
 // Exit app?
}
//
-(IBAction)collectFeedback:(id)sender {
    //NSAssert(parentVC != nil, @"Parent view controller shouldn't be nil!");
    
    //    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:HAS_REVIEWED];
    //    [[NSUserDefaults standardUserDefaults] synchronize];
    
    if ([MFMailComposeViewController canSendMail]) {
        
//        NSDictionary* infoDict = [[NSBundle mainBundle] infoDictionary];
//        NSString* version = [infoDict objectForKey:@"CFBundleVersion"];
//        
//        NSString* iosVersion = [[UIDevice currentDevice] systemVersion];
//        NSString* modelType = [UIDevice currentDevice].model;
        
        NSString* message = [NSString stringWithFormat:@"Test message"];
//
        mailViewController = [[MFMailComposeViewController alloc] init];

        mailViewController.mailComposeDelegate = self;
        [mailViewController setSubject:[NSString stringWithFormat:@"Flyt Path Feedback"]];
        [mailViewController setToRecipients:@[@"Erik@ElliesGames.com"]];
        [mailViewController setMessageBody:message isHTML:NO];
//
        [self presentViewController:mailViewController animated:YES completion:0];
        
    }
    
    else {
        
        NSLog(@"Device is unable to send email in its current state.");
        
    }
}

-(void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [mailViewController dismissViewControllerAnimated:YES completion:0];
    
}


@end
