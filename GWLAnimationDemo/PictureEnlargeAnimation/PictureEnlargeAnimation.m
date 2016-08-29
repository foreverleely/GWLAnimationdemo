//
//  PictureEnlargeAnimation.m
//  GWLAnimationDemo
//
//  Created by liyangly on 16/8/29.
//  Copyright © 2016年 liyangly. All rights reserved.
//

#import "PictureEnlargeAnimation.h"

@implementation PictureEnlargeAnimation

#pragma mark - UIViewControllerAnimatedTransitioning
- (NSTimeInterval)transitionDuration:
    (id<UIViewControllerContextTransitioning>)transitionContext {
  return 0.5;
}

- (void)animateTransition:
    (id<UIViewControllerContextTransitioning>)transitionContext {

  self.fromVC = [transitionContext
      viewControllerForKey:UITransitionContextFromViewControllerKey];
  self.toVC = [transitionContext
      viewControllerForKey:UITransitionContextToViewControllerKey];
  self.containerView = [transitionContext containerView];
  self.containerView.backgroundColor = [UIColor cyanColor];
  self.transitionContext = transitionContext;

  [self translationAnimation];
}

- (void)completeTransition {
  [self.transitionContext
      completeTransition:!self.transitionContext.transitionWasCancelled];
}

#pragma mark - method
- (void)translationAnimation {
  //需要子类重写
}

@end
