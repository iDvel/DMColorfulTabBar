//
//  DMColorfulTabBar.m
//  ColorfulTabBar
//
//  Created by Dvel on 15/12/9.
//  Copyright © 2015年 Dvel. All rights reserved.
//

#import "DMColorfulTabBar.h"

// 随机颜色
#define Random_Color [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0]
#define Item_Width CGRectGetWidth(self.frame) / [self colorArray].count
#define Item_Height CGRectGetHeight(self.frame)

@interface DMColorfulTabBar () <UITabBarDelegate>
@property (nonatomic, strong) UIView *colorfulView;
@property (nonatomic, strong) UIView *maskView;

@property (nonatomic, assign) NSUInteger toIndex;
@end

@implementation DMColorfulTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		self.delegate = self;
		[self setupColorView];
		[self setupMaskview];
	}
	return self;
}

#pragma mark
- (void)setupColorView
{
	self.colorfulView = [[UIView alloc] initWithFrame:self.bounds];
	[self addSubview:self.colorfulView];
	
	for (int i = 0; i < [self colorArray].count; i++) {
		UIView *view = [[UIView alloc] initWithFrame:CGRectMake(Item_Width * i, 0, Item_Width, Item_Height)];
		view.backgroundColor = self.colorArray[i];
		[self.colorfulView addSubview:view];
	}
}

- (void)setupMaskview
{
	self.maskView = ({
		UIView *maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Item_Width, Item_Height)];
		maskView.backgroundColor = [UIColor whiteColor];
		maskView;
	});
	self.colorfulView.layer.mask = self.maskView.layer;
}

- (void)animation
{
	[UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
		self.maskView.frame = CGRectMake(Item_Width * self.toIndex, 0, Item_Width, Item_Height);
	} completion:nil];
}

#pragma mark getter
- (NSArray *)colorArray
{
	//	return @[[UIColor redColor], [UIColor yellowColor], [UIColor blueColor], [UIColor greenColor], [UIColor purpleColor]];
	return @[Random_Color, Random_Color, Random_Color, Random_Color, Random_Color];
}

#pragma mark UITabBarDelegate
// 因为tabbar设置代理先后顺序的原因，如果在初始化时，就将代理设置为自己，系统会在添加到UITabbarController上的时候，将代理设置为UITabbarController。
- (void)didMoveToSuperview {
	[super didMoveToSuperview];
	self.delegate = self;
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
	NSLog(@"%zd", [self.items indexOfObject:item]);
	self.toIndex = [self.items indexOfObject:item];
	[self animation];
}

@end
