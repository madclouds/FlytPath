//
//  DetailViewController.m
//  FlytPath
//
//  Created by Erik Bye on 9/12/14.
//  Copyright (c) 2014 Erik Bye. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
}
//
//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
//    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    backButton.frame = CGRectMake(10, 10, 50, 50);
//    [backButton setBackgroundImage:[UIImage imageNamed:@"backbutton"] forState:UIControlStateNormal];
//    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
//    
//    [self.view addSubview:backButton];
//    
//    self.view.frame = [UIScreen mainScreen].bounds;
//    
//}


-(void)back {
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)loadURL:(NSString *)url
{
    return YES;
    //Do something with link clicks here
//    DetailViewController* lvc = [[DetailViewController alloc] initWithURL:url];
//    
//    [self.navigationController pushViewController:lvc animated:YES];
}

@end
