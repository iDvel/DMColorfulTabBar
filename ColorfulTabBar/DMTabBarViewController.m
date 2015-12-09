//
//  DMTabBarViewController.m
//  ColorfulTabBar
//
//  Created by Dvel on 15/12/9.
//  Copyright © 2015年 Dvel. All rights reserved.
//

#import "DMTabBarViewController.h"
#import "DMColorfulTabBar.h"

@interface DMTabBarViewController ()

@end

@implementation DMTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (instancetype)init
{
	self = [super init];
	if (self) {
		DMColorfulTabBar *tabBar = [[DMColorfulTabBar alloc] initWithFrame:self.view.bounds];
		[self setValue:tabBar forKey:@"tabBar"];
		
		[self addChildViewControllerWithTitle:@"主页"];
		[self addChildViewControllerWithTitle:@"通讯录"];
		[self addChildViewControllerWithTitle:@"发现"];
		[self addChildViewControllerWithTitle:@"消息"];
		[self addChildViewControllerWithTitle:@"设置"];
	}
	return self;
}

- (void)addChildViewControllerWithTitle:(NSString *)title
{
	[self addChildViewController:({
		UIViewController *vc = [UIViewController new];
		vc.view.backgroundColor = [UIColor whiteColor];
		vc.title = title;
		UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:vc];
		navC;
	})];
}



@end
