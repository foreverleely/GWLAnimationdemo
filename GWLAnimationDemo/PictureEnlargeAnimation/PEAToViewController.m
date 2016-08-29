//
//  PEAToViewController.m
//  GWLAnimationDemo
//
//  Created by liyangly on 16/8/29.
//  Copyright © 2016年 liyangly. All rights reserved.
//

#import "PEAToViewController.h"
#import "PopPEAnimation.h"
@interface PEAToViewController () <UINavigationControllerDelegate> {
  UIImageView *currentImageView;
  CGRect currentFrame;
}
@end

@implementation PEAToViewController

#pragma mark - life cycle
- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"格瓦拉效果一:图片浏览";
  self.view.backgroundColor = [UIColor whiteColor];
  self.navigationItem.hidesBackButton = YES;
  self.navigationController.delegate = self;
  [self setLayout];
}

//- (void)viewDidAppear:(BOOL)animated {
//
//    [super viewDidAppear:animated];
//
//    currentImageView.hidden = NO;
//
//    self.navigationController.delegate = self;
//}
//
//- (void)viewWillDisappear:(BOOL)animated {
//
//    [super viewWillDisappear:animated];
//
//    currentImageView.hidden = YES;
//}

- (void)setLayout {

  CGSize ScreenSize = [UIScreen mainScreen].bounds.size;
  float imagewidth = 150;
  UIButton *button = [[UIButton alloc] init];
  [self.view addSubview:button];
  button.frame =
      CGRectMake((ScreenSize.width - imagewidth) / 2,
                 (ScreenSize.height - imagewidth) / 2, imagewidth, imagewidth);
  [button setBackgroundImage:self.toimage forState:UIControlStateNormal];
  [button addTarget:self
                action:@selector(backtofromVC)
      forControlEvents:UIControlEventTouchUpInside];

  currentImageView = [[UIImageView alloc] initWithImage:self.toimage];
}

#pragma mark - method
- (void)backtofromVC {
  [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UINavigationControllerDelegate
- (id<UIViewControllerAnimatedTransitioning>)
           navigationController:(UINavigationController *)navigationController
animationControllerForOperation:(UINavigationControllerOperation)operation
             fromViewController:(UIViewController *)fromVC
               toViewController:(UIViewController *)toVC {

  PopPEAnimation *transition = [PopPEAnimation new];
  transition.animationDuration = 0.5;
  transition.PEAImageView = currentImageView;
  transition.fromImageFrame = self.fromImageFrame;

  return transition;
}

#pragma mark - getter and setter

@end
