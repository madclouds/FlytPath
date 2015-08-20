//
//  TitleViewController.m
//  FlytPath
//
//  Created by Erik Bye on 2/5/15.
//  Copyright (c) 2015 Erik Bye. All rights reserved.
//

#import "TitleViewController.h"

@interface TitleViewController ()

@end

@implementation TitleViewController

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
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    UIImageView* titleView = [[UIImageView alloc] initWithFrame:self.view.frame];
    titleView.image = [UIImage imageNamed:@"title"];
    titleView.userInteractionEnabled = YES;
    titleView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:titleView];
    
    UITapGestureRecognizer* tgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(loadMenu)];
    [titleView addGestureRecognizer:tgr];
}

-(void)loadMenu {
    
    HomeViewController* hvc = [[HomeViewController alloc] initWithNibName:0 bundle:0];
    SlideNavigationController* snc = [[SlideNavigationController alloc] initWithRootViewController:hvc];
    SideMenuViewController* smvc = [[SideMenuViewController alloc] initWithNibName:@"SideMenuViewController" bundle:nil];
    
    [SlideNavigationController sharedInstance].leftMenu = smvc;
    [self presentViewController:snc animated:YES completion:0];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
