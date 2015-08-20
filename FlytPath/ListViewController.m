//
//  ListViewController.m
//  FlytPath
//
//  Created by Erik Bye on 9/12/14.
//  Copyright (c) 2014 Erik Bye. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)loadURL:(NSString *)url
{
    
    DetailViewController* lvc = [[DetailViewController alloc] initWithURL:url];
    
    [self.navigationController pushViewController:lvc animated:YES];
    
    return NO;
}

@end
