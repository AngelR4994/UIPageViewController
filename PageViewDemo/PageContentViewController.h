//
//  PageContentViewController.h
//  PageViewDemo
//
//  Created by xax on 7/24/16.
//  Copyright © 2016 xax. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageContentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

@property NSUInteger    pageIndex;
@property NSString      *titleText;
@property NSString      *imageFile;

@end
