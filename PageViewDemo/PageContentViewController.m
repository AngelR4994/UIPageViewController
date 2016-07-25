//
//  PageContentViewController.m
//  PageViewDemo
//
//  Created by xax on 7/24/16.
//  Copyright © 2016 xax. All rights reserved.
//

#import "PageContentViewController.h"

@implementation PageContentViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.backgroundImageView.image  = [UIImage imageNamed:self.imageFile];
    self.titleLabel.text            = self.titleText;
}



@end
