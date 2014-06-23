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

@interface LNViewController ()
@property (nonatomic) LNAppUser *appUser;
@property (nonatomic) LNTopbarView *topbarView;
@property (nonatomic) UIWebView *detailWebView;
@end

@implementation LNViewController

- (id)initWithAppUser:(LNAppUser*)user
{
  if (self = [super init]){
    self.appUser = user;
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
    // For iPhone
    
  } else {
    // For iPad
  }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
  
}

@end
