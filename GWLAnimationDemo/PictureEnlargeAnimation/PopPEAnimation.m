//
//  PopPEAnimation.m
//  GWLAnimationDemo
//
//  Created by liyangly on 16/8/29.
//  Copyright © 2016年 liyangly. All rights reserved.
//

#import "PopPEAnimation.h"

@implementation PopPEAnimation

- (void)translationAnimation {

  UIImageView *transitionImageView =
      [[UIImageView alloc] initWithFrame:destinationFrame];
  transitionImageView.image = self.PEAImageView.image;
  [self.containerView addSubview:self.toVC.view];
  [self.containerView addSubview:transitionImageView];

  self.fromVC.view.alpha = 0.f;
  self.toVC.view.alpha = 0;

  [UIView animateWithDuration:self.animationDuration
      delay:0
      usingSpringWithDamping:1
      initialSpringVelocity:0.f
      options:0
      animations:^{

        transitionImageView.frame = self.fromImageFrame;
        self.toVC.view.alpha = 1;

      }
      completion:^(BOOL finished) {

        [transitionImageView removeFromSuperview];
        [self completeTransition];

      }];
}

@end
