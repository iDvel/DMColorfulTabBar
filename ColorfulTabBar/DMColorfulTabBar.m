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

@interface DMColorfulTabBar () <UITabBarDelegate>
@property (nonatomic, strong) UIView *colorfulView;
@property (nonatomic, strong) UIView *maskView;
@end

@implementation DMColorfulTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
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
		UIView *view = [[UIView alloc] initWithFrame:CGRectMake(Item_Width * i, 0, Item_Width, CGRectGetHeight(self.frame))];
		view.backgroundColor = self.colorArray[i];
		[self.colorfulView addSubview:view];
			
	}
}

- (void)setupMaskview
{
	self.maskView = ({
		UIView *maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Item_Width, CGRectGetHeight(self.frame))];
		maskView.backgroundColor = [UIColor blackColor];
		maskView;
	});
	self.colorfulView.layer.mask = self.maskView.layer;
}



#pragma mark getter
- (NSArray *)colorArray
{
//	return @[Random_Color, Random_Color, Random_Color, Random_Color, Random_Color];
	return @[[UIColor redColor], [UIColor yellowColor], [UIColor blueColor], [UIColor greenColor], [UIColor purpleColor]];
}

#pragma mark UITabBarDelegate
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
	
}

@end
