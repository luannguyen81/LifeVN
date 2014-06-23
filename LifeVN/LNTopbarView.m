//
//  LNTopbarView.m
//  LifeVN
//
//  Created by Luan Nguyen on 2014-06-17.
//  Copyright (c) 2014 LN. All rights reserved.
//

#import "LNTopbarView.h"
@interface LNTopbarView()
@property (nonatomic) LNTopbarViewMode viewMode;
@property (nonatomic) NSArray *viewCategories;
@property (nonatomic) UITextField *searchField;
@property (nonatomic) UIButton *goBack;
@property (nonatomic) UIButton *goForward;
@property (nonatomic) UIButton *refresh;
@end
@implementation LNTopbarView

- (id)initWithMode:(LNTopbarViewMode)mode categories:(NSArray*)categories
{
  if (self = [super init]){
    self.viewMode = mode;
    self.viewCategories = categories;
  }
  return self;
}
- (void)layoutSubviews
{
  [super layoutSubviews];
}
@end
