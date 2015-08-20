//
//  WebViewController.m
//  FlytPath
//
//  Created by Erik Bye on 9/12/14.
//  Copyright (c) 2014 Erik Bye. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()
{
   
}
@end

@implementation WebViewController
- (id)initWithURL:(NSString*)aURL
{
    self = [super initWithNibName:0 bundle:0];
    if (self) {
        // Custom initialization
        pageURL = aURL;
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    UIWebView* webview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    NSURL *url = [NSURL URLWithString:pageURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [webview loadRequest:requestObj];

    webview.delegate=self;
    [self.view addSubview:webview];
    
    UIButton *favButton = [[UIButton alloc] init];
    
    [favButton setImage:[UIImage imageNamed:@"back_icon"] forState:UIControlStateNormal];
    [favButton addTarget:self action:@selector(back)
        forControlEvents:UIControlEventTouchUpInside];
    favButton.frame = CGRectMake(0, 0, 38, 38);
    UIBarButtonItem *button = [[UIBarButtonItem alloc]
                               initWithCustomView:favButton];
    
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_icon"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    anotherButton.tintColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = anotherButton;
    self.navigationItem.leftItemsSupplementBackButton = NO;
//    self.navigationItem.backBarButtonItem
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
}

-(void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    
    if (navigationType == UIWebViewNavigationTypeLinkClicked){
        
        return [self.delegate loadURL:[request.URL absoluteString]];
        
    }
    
    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    self.title=[webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}

@end
