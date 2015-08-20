//
//  BaseViewController.m
//  FlytPath
//
//  Created by Erik Bye on 2/5/15.
//  Copyright (c) 2015 Erik Bye. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        // iOS 7
        [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
    } else {
        // iOS 6
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    }
    
//    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu_icon"] style:UIBarButtonItemStylePlain target:self action:@selector(loadSideMenu)];
//    anotherButton.tintColor = [UIColor whiteColor];
//    
//    self.navigationItem.leftBarButtonItem = anotherButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
}


-(void)loadSideMenu {
//    
//    [self.navigationController setNavigationBarHidden:YES animated:NO];
//    SideMenuViewController* smvc = [[SideMenuViewController alloc] initWithNibName:@"SideMenuViewController" bundle:nil];
//    [self.navigationController pushViewController:smvc animated:YES];
}


- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
