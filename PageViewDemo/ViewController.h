//
//  ViewController.h
//  PageViewDemo
//
//  Created by xax on 7/24/16.
//  Copyright © 2016 xax. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageContentViewController.h"
@interface ViewController : UIViewController<UIPageViewControllerDataSource>


- (IBAction)startWalkthrough:(id)sender;
@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray   *pageTitles;
@property (strong, nonatomic) NSArray   *pageImages;

@end

