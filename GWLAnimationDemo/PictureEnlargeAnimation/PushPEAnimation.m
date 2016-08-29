//
//  PushPEAnimation.m
//  GWLAnimationDemo
//
//  Created by liyangly on 16/8/29.
//  Copyright © 2016年 liyangly. All rights reserved.
//

#import "PushPEAnimation.h"

@implementation PushPEAnimation

- (void)translationAnimation {

  //将选中的图片放入动画协议的容器中
  UIImageView *transitionImageView =
      [[UIImageView alloc] initWithFrame:self.PEAImageFrame];
  transitionImageView.image = self.PEAImageView.image;
  [self.containerView addSubview:self.toVC.view];
  [self.containerView addSubview:transitionImageView];

  self.toVC.view.alpha = 0;
  self.fromVC.view.alpha = 0.5f;

  //给过渡图片增加阴影
  transitionImageView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
  transitionImageView.layer.shadowOpacity = 1.0;

  //过渡动画效果
  //（这里是将过渡图片做一个放大，然后让其不可见）
  [UIView animateWithDuration:1.0
      delay:0
      usingSpringWithDamping:1
      initialSpringVelocity:0.f
      options:0
      animations:^{

        transitionImageView.transform = CGAffineTransformMakeScale(1.8, 1.8);
        transitionImageView.frame = transitionFrame;

      }
      completion:^(BOOL finished) {

        transitionImageView.layer.shadowOpacity = 0;

      }];

  //最终动画效果
  [UIView animateWithDuration:0.5
      delay:0.7
      usingSpringWithDamping:1
      initialSpringVelocity:0.f
      options:0
      animations:^{
        transitionImageView.transform = CGAffineTransformIdentity;
      }
      completion:^(BOOL finished) {
        //显示目标控制器
        [self circleTransition];
        self.toVC.view.alpha = 1.f;
        [transitionImageView removeFromSuperview];
        [self completeTransition];
      }];
}

- (void)circleTransition {

  CGRect startcicleRect =
      CGRectMake((kScreenW - 200) / 2, (kScreenH - 200) / 2, 200, 200);
  //起始状态，圆形范围
  UIBezierPath *bezierPath =
      [UIBezierPath bezierPathWithOvalInRect:startcicleRect];
  CGPoint extrePoint =
      CGPointMake(self.containerView.center.x, self.containerView.center.y);
  //圆形半径
  float radius =
      sqrtf(extrePoint.x * extrePoint.x + extrePoint.y * extrePoint.y);
  //最终，圆形范围
  UIBezierPath *finalPath = [UIBezierPath
      bezierPathWithOvalInRect:CGRectInset(startcicleRect, -radius, -radius)];

  //设置蒙板
  CAShapeLayer *maskLayer = [CAShapeLayer layer];
  maskLayer.path = finalPath.CGPath;
  self.toVC.view.layer.mask = maskLayer;

  //蒙板的动画效果
  CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
  animation.fromValue = (__bridge id _Nullable)(bezierPath.CGPath);
  animation.toValue = (__bridge id _Nullable)(finalPath.CGPath);
  animation.duration = [self transitionDuration:self.transitionContext];
  maskLayer.delegate = self;
  [maskLayer addAnimation:animation forKey:@"path"];
}

@end
