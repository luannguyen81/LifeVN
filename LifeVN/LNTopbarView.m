//
//  LNTopbarView.m
//  LifeVN
//
//  Created by Luan Nguyen on 2014-06-17.
//  Copyright (c) 2014 LN. All rights reserved.
//

#import "LNTopbarView.h"
#import "LNCategory.h"
#import "LNResourceLink.h"
#import "LNConstants.h"

#define kButtonWidth 70
#define kButtonHeight 40
#define kIconSize 30

@interface LNTopbarView() <UITextFieldDelegate>
@property (nonatomic) LNTopbarViewMode viewMode;
@property (nonatomic) NSArray *viewCategories;
@property (nonatomic) NSMutableArray *categoryButtons;
@property (nonatomic) UITextField *searchField;
@property (nonatomic) UIButton *goBack;
@property (nonatomic) UIButton *goForward;
@property (nonatomic) UIButton *refresh;
@property (nonatomic) NSString *currentSearchString;
@property (nonatomic) NSMutableDictionary *categoryLinks;
@end
@implementation LNTopbarView

- (id)initWithMode:(LNTopbarViewMode)mode categories:(NSArray*)categories
{
    if (self = [super init]){
        self.viewMode = mode;
        self.viewCategories = categories;
        self.categoryLinks = [[NSMutableDictionary alloc] initWithCapacity:categories.count];
        self.categoryButtons = [[NSMutableArray alloc] initWithCapacity:categories.count];
        self.backgroundColor = cLNDarkGray;
        self.searchField = [[UITextField alloc] initWithFrame:CGRectZero];
        self.searchField.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.searchField.delegate = self;
        self.searchField.layer.cornerRadius = 10;
        self.searchField.placeholder = @"Search Google or Enter an address";
        [self.searchField setBackgroundColor:cLNLightGray];
        [self addSubview:self.searchField];
        
        self.goBack = [[UIButton alloc] initWithFrame:CGRectZero];
        [self.goBack setBackgroundImage:[UIImage imageNamed:iTopbarGoBack] forState:UIControlStateNormal];
        [self.goBack setBackgroundColor:cLNLightGray];
        [self.goBack addTarget:self action:@selector(goBack:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.goBack];
        
        self.goForward = [[UIButton alloc] initWithFrame:CGRectZero];
        [self.goForward setBackgroundImage:[UIImage imageNamed:iTopbarGoForward] forState:UIControlStateNormal];
        [self.goForward setBackgroundColor:cLNLightGray];
        [self.goForward addTarget:self action:@selector(goForward:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.goForward];
        
        self.refresh = [[UIButton alloc] initWithFrame:CGRectZero];
        [self.refresh setBackgroundImage:[UIImage imageNamed:iTopbarRefresh] forState:UIControlStateNormal];
        [self.refresh setBackgroundColor:cLNLightGray];
        [self.refresh addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.refresh];
        
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    if (self.viewMode == LNTopbarViewiPadFullMode){
        
        CGFloat x = 5;
        CGFloat padding = 5;
        NSDictionary *attributeDic = @{
                                       NSFontAttributeName : [UIFont fontWithName:@"Helvetica" size:14],
                                       NSForegroundColorAttributeName : cLNNavyBlack,
                                       };
        BOOL selected = NO;
        for (LNCategory *cat in self.viewCategories) {
            [self.categoryLinks setObject:cat.resourceLinks forKey:cat.name];
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(x, padding, kButtonWidth, kButtonHeight)];
            button.layer.cornerRadius = 10;
            [button setAttributedTitle:[[NSAttributedString alloc] initWithString:cat.name attributes:attributeDic] forState:UIControlStateNormal];

            [button addTarget:self action:@selector(selectCategoryFromButton:) forControlEvents:UIControlEventTouchUpInside];
            if (!selected){
                selected = YES;
                [button setBackgroundColor:cLNSelectionBlue];
            }else{
                [button setBackgroundColor:cLNLightGray];
            }
            [self.categoryButtons addObject:button];
            [self addSubview:button];
            x += kButtonWidth + padding;
        }
        
        
        self.goBack.frame = CGRectMake(x, padding * 2, kIconSize, kIconSize);
        x += padding + kIconSize;
        self.goForward.frame = CGRectMake(x, padding * 2, kIconSize, kIconSize);
        x += padding + kIconSize;
        self.refresh.frame = CGRectMake(x, padding * 2, kIconSize, kIconSize);
        x += padding + kIconSize;
        self.searchField.frame = CGRectMake(x, padding, self.bounds.size.width - x - padding, kButtonHeight);
    }
}

- (void)selectCategoryFromButton:(id)sender
{
    UIButton *selectedButton = (UIButton*)sender;
    NSString *cat = selectedButton.titleLabel.text;
    NSLog(@"select category %@", cat);
    for (UIButton *button in self.categoryButtons) {
        if ([button.titleLabel.text isEqualToString:cat]) {
            [button setBackgroundColor:cLNSelectionBlue];
            LNResourceLink *link = [self.categoryLinks objectForKey:cat][0];
            [self loadWebViewWithURL:link.resourceURL];
        }else{
            [button setBackgroundColor:cLNLightGray];
        }
    }
}
#pragma mark - textfield delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (![self.currentSearchString isEqualToString:textField.text]){
        self.currentSearchString = textField.text;
        [self loadWebViewWithSearchString]; 
    }
    [self.searchField resignFirstResponder];
    return YES;
}
#pragma mark - helpers
- (void)loadWebViewWithURL:(NSURL*)url
{
    [self.delegate loadWebViewWithURL:url];
}
- (void)loadWebViewWithSearchString
{
    [self.delegate loadWebViewWithString:self.currentSearchString];
}

- (void)goBack:(id)sender
{
    [self.delegate goBack];
}
- (void)goForward:(id)sender
{
    [self.delegate goForward];
}
- (void)refresh:(id)sender
{
    [self.delegate refresh];
}
@end
