//
//  PictureEnlargeAnimation.h
//  GWLAnimationDemo
//
//  Created by liyangly on 16/8/29.
//  Copyright © 2016年 liyangly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

#define destinationFrame CGRectMake((kScreenW - 200) / 2, (kScreenH - 200) / 2, 200, 200)
#define transitionFrame CGRectMake((kScreenW - 180) / 2, (kScreenH - 180) / 2, 180, 180)

@interface PictureEnlargeAnimation : NSObject<UIViewControllerAnimatedTransitioning>

/**
 *  起始控制器
 */
@property (nonatomic, strong) UIViewController *fromVC;

/**
 *  终点控制器
 */
@property (nonatomic, strong) UIViewController *toVC;

/**
 *  容器
 */
@property (nonatomic, strong) UIView *containerView;

/**
 *  转场动画上下文
 */
@property (nonatomic, weak) id<UIViewControllerContextTransitioning> transitionContext;


/**
 *  选中的图片
 */
@property (nonatomic, strong) UIImageView *PEAImageView;

/**
 *  选中图片的frame
 */
@property (nonatomic, assign) CGRect PEAImageFrame;

/**
 *  动画时间
 */
@property (nonatomic, assign) CGFloat animationDuration;



/**
 *  动画具体实现方法，由子类重写
 */
- (void)translationAnimation;

/**
 *  动画执行完成
 */
- (void)completeTransition;

@end
