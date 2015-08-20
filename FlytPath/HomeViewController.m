//
//  HomeViewController.m
//  FlytPath
//
//  Created by Erik Bye on 9/12/14.
//  Copyright (c) 2014 Erik Bye. All rights reserved.
//

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) //1
#define MENU_JSON_URL [NSURL URLWithString:@"https://s3.amazonaws.com/flytpath-1/menu.json"]
#define FOOTER_URL [NSURL URLWithString:@"https://s3.amazonaws.com/flytpath-1/footer.html"]

#import "HomeViewController.h"


@interface HomeViewController ()

@end

@implementation HomeViewController
{
    NSArray* buttons;
    UIActivityIndicatorView * aiv;
    UIScrollView* scrollView;
    UIWebView* footerWebView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Flyt Path";
    
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.view.backgroundColor = UIColorFromRGB(0x181c1d);
    
    if (!buttons) {
        dispatch_async(kBgQueue, ^{
            NSData* data = [NSData dataWithContentsOfURL:
                            MENU_JSON_URL];
            [self performSelectorOnMainThread:@selector(fetchedData:)
                                   withObject:data waitUntilDone:NO];
        });
    }
    
    
}



- (void)fetchedData:(NSData *)responseData {
    //parse out the json data
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:responseData //1
                          
                          options:kNilOptions
                          error:&error];
    
    buttons = [json objectForKey:@"buttons"]; //2
    [self setupUI];
    
}

- (void)fetchedButtonImage:(NSData *)responseData {
    //parse out the json data
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:responseData //1
                          
                          options:kNilOptions
                          error:&error];
    
    buttons = [json objectForKey:@"buttons"]; //2
    [self setupUI];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    
    if (!buttons) {
        self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        scrollView.backgroundColor = self.view.backgroundColor;
        [self.view addSubview:scrollView];
        
        aiv = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        aiv.center = self.navigationController.view.center;
        [self.view addSubview:aiv];
        [aiv startAnimating];
        aiv.hidesWhenStopped = YES;
    
    }

    
}

-(void)viewDidAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

-(void)setupUI {

    CGSize buttonSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height/3);
    CGSize footerSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height/3);
    CGFloat padding = 20;
    [aiv stopAnimating];
    
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, buttonSize.height*buttons.count+footerSize.height);
    int index = 0;
    for (NSDictionary* button in buttons) {
        NSString* imageURL = [button objectForKey:@"imageURL"];
        NSString* title = [button objectForKey:@"title"];
        NSString* count = [button objectForKey:@"count"];
//        NSString* destination = [button objectForKey:@"destination"];
        
       
        UIImageView* buttonImageView = [[UIImageView alloc] init];
        UIActivityIndicatorView* imageAIV = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
//        aiv.center = self.navigationController.view.center;
        
        
        dispatch_async(kBgQueue, ^{
            NSURL *url = [NSURL URLWithString:imageURL];
            NSData *data = [NSData dataWithContentsOfURL:url];
            UIImage *image = [UIImage imageWithData:data];
            buttonImageView.image = image;
            [imageAIV stopAnimating];
        });
        
        buttonImageView.frame = CGRectMake(0, index*buttonSize.height, buttonSize.width, buttonSize.height);
        buttonImageView.userInteractionEnabled = YES;
        buttonImageView.tag = index;
        imageAIV.center = CGPointMake(buttonSize.width/2, buttonSize.height/2);
        [buttonImageView addSubview:imageAIV];
        [imageAIV startAnimating];
        
        UILabel* buttonLabel = [[UILabel alloc] initWithFrame:CGRectMake(padding, buttonSize.height-buttonSize.height/4, buttonSize.width, buttonSize.height/4)];
        buttonLabel.text = title;
        buttonLabel.textColor = [UIColor whiteColor];
        buttonLabel.backgroundColor = [UIColor clearColor];
        buttonLabel.font = [UIFont fontWithName:@"Helvetica-bold" size:12];
        
        UILabel* countLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, buttonSize.height-buttonSize.height/4, buttonSize.width-padding, buttonSize.height/4)];
        countLabel.text = count;
        countLabel.textAlignment = NSTextAlignmentRight;
        countLabel.textColor = [UIColor whiteColor];
        countLabel.backgroundColor = [UIColor clearColor];
        countLabel.font = [UIFont fontWithName:@"Helvetica-bold" size:12];
        
        [buttonImageView addSubview:buttonLabel];
        [buttonImageView addSubview:countLabel];
        [scrollView addSubview:buttonImageView];
        
        UITapGestureRecognizer* tgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonPressed:)];
        [buttonImageView addGestureRecognizer:tgr];
        
        
        index++;
//        UIView* slot1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/3)];
//        slot1.backgroundColor = [UIColor redColor];
//        [self.view addSubview:slot1];
    }

    
    NSURL* nsUrl = FOOTER_URL;
    
    NSURLRequest* request = [NSURLRequest requestWithURL:nsUrl cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:30];
    
    footerWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, buttons.count*buttonSize.height, footerSize.width, footerSize.height)];
    [footerWebView loadRequest:request];

    [scrollView addSubview:footerWebView];
    
}


-(void)buttonPressed:(UITapGestureRecognizer*)tap{
    UIImageView* tappedImage = (UIImageView*)tap.view;
    NSDictionary* tappedButton = buttons[tappedImage.tag];
    ListViewController* lvc = [[ListViewController alloc] initWithURL:[tappedButton objectForKey:@"destination"]];
//    lvc.title = [tappedButton objectForKey:@"title"];
    [self.navigationController pushViewController:lvc animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
    return NO;
}

@end
