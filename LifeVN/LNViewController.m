//
//  LNViewController.m
//  LifeVN
//
//  Created by Luan Nguyen on 2014-06-17.
//  Copyright (c) 2014 LN. All rights reserved.
//

#import "LNViewController.h"
#import "LNTopbarView.h"
#import "LNTypes.h"
#import "LNConstants.h"
#import "LNResourceLink.h"
#import "LNCategory.h"

@interface LNViewController () <LNTopbarViewDelegate, UIWebViewDelegate>
@property (nonatomic) LNAppUser *appUser;
@property (nonatomic) LNTopbarView *topbarView;
@property (nonatomic) UIWebView *detailWebView;
@property (nonatomic) UILabel *errorLabel;
@property (nonatomic) UIActivityIndicatorView *spinner;
@end

@implementation LNViewController

- (id)initWithAppUser:(LNAppUser*)user
{
  if (self = [super init]){
    self.appUser = user;

      self.topbarView = [[LNTopbarView alloc] initWithMode:LNTopbarViewiPadFullMode categories:self.appUser.categories];
      self.topbarView.delegate = self;
      [self.view addSubview:self.topbarView];
      
      self.detailWebView = [[UIWebView alloc] initWithFrame:CGRectZero];
      self.detailWebView.backgroundColor = cLNLightGray;
      self.detailWebView.delegate = self;
      [self.view addSubview:self.detailWebView];
      
      self.errorLabel = [[UILabel alloc] initWithFrame:CGRectZero];
      self.errorLabel.textColor = cLNDeepRed;
      [self.view addSubview:self.errorLabel];
      
      self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
      [self.view addSubview:self.spinner];
  }
  return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
  
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.view.backgroundColor = [UIColor whiteColor];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        // For iPhone
        
    } else {
        // For iPad
        
        self.topbarView.frame = CGRectMake(0, kTopbarYOffset, kDefaultiPadWidth, kTopbarHeight);
        self.detailWebView.frame = CGRectMake(0, kTopbarHeight + kTopbarYOffset, kDefaultiPadWidth, kDefaultiPadHeight - kTopbarHeight - kTopbarYOffset);
        self.spinner.center = self.detailWebView.center;
        self.errorLabel.frame = CGRectMake(0, 0, kDefaultiPadWidth/3, kTopbarHeight);
        self.errorLabel.center = self.detailWebView.center;
    }
    // load first category
    LNResourceLink *link = ((LNCategory*) self.appUser.categories[0]).resourceLinks[0];
    [self.detailWebView loadRequest:[NSURLRequest requestWithURL:link.resourceURL]];
}
#pragma mark - detail webview delegate
- (void)loadWebViewWithURL:(NSURL*)url
{
    [self.detailWebView loadRequest:[NSURLRequest requestWithURL:url]];
}
- (void)loadWebViewWithString:(NSString *)searchString
{
    if ([searchString rangeOfString:@" "].location != NSNotFound){
        NSRange range = [searchString rangeOfString:@"http://"];
        if (range.location != NSNotFound){
            searchString = [searchString stringByReplacingOccurrencesOfString:@"http://" withString:@"" options:NSCaseInsensitiveSearch range:range];
        }
        [self searchGoogleWithString:searchString];
    }
    else{
        [self.detailWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://%@",searchString]]]];
    }
}
- (void)searchGoogleWithString:(NSString*)searchString
{
    [self.detailWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://google.com/search?q=%@", [searchString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]]]];
}
- (void)goBack
{
    [self.detailWebView goBack];
}
- (void)goForward
{
    [self.detailWebView goForward];
}
- (void)refresh
{
    [self.detailWebView reload];
}

#pragma mark - webview delegate
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    self.errorLabel.hidden = YES;
    [self.spinner startAnimating];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    self.errorLabel.hidden = YES;
    [self.spinner stopAnimating];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"Failed to load request url %@", webView.request);
    [self.spinner stopAnimating];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                    message:error.description
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

@end
