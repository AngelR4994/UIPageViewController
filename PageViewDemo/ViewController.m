//
//  ViewController.m
//  PageViewDemo
//
//  Created by xax on 7/24/16.
//  Copyright © 2016 xax. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _pageTitles =@[@"over 200 Tips and Tricks"];
    _pageImages =@[@"Trick.jpg"];
    
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startWalkthrough:(id)sender {
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers= @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
}

#pragma mark - Page View Controller Data Source

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index =((PageContentViewController *)viewController).pageIndex;
    if((index == 0)||(index == NSNotFound))
    {
        return nil;
    }
    index--;
    return [self viewControllerAtIndex:index];
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(nonnull UIViewController *)viewController
{
    NSUInteger index =((PageContentViewController *)viewController).pageIndex;
    if(index == NSNotFound)
    {
     return nil;
    }
    index++;
    if(index == [self.pageTitles count])
    {
            return nil;
    }
    
    return [self viewControllerAtIndex:index];
}


-(PageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if(([self.pageTitles count]== 0)||(index >=[self.pageTitles count]))
    {
        return nil;
    }
    PageContentViewController *pageContentViewController= [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    pageContentViewController.imageFile= self.pageImages[index];
    pageContentViewController.titleText =self.pageTitles[index];
    pageContentViewController.pageIndex =index;
    return pageContentViewController;
}

-(NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pageTitles count];
}
-(NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}
@end
