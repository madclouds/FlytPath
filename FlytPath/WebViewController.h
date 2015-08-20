//
//  WebViewController.h
//  FlytPath
//
//  Created by Erik Bye on 9/12/14.
//  Copyright (c) 2014 Erik Bye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface WebViewController : BaseViewController <UIWebViewDelegate>
{
     NSString* pageURL;
}
@property (nonatomic) id delegate;
- (id)initWithURL:(NSString*)aURL;

@end


@protocol WebViewDelegate <NSObject>

-(BOOL)loadURL:(NSString*)url;

@end
