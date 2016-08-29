//
//  PEAFromViewController.m
//  GWLAnimationDemo
//
//  Created by liyangly on 16/8/29.
//  Copyright © 2016年 liyangly. All rights reserved.
//

#import "PEAFromViewController.h"
#import "PEAToViewController.h"
#import "PushPEAnimation.h"

@interface PEAFromViewController () <UINavigationControllerDelegate> {
  UIImageView *currentImageView;
  CGRect currentFrame;
}
@end

@implementation PEAFromViewController

#pragma mark - life cycle
- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"格瓦拉效果一:图片浏览";
  self.view.backgroundColor = [UIColor whiteColor];
  [self setLayout];
}

- (void)viewDidAppear:(BOOL)animated {

  [super viewDidAppear:animated];

  currentImageView.hidden = NO;

  self.navigationController.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {

  [super viewWillDisappear:animated];

  currentImageView.hidden = YES;
}

- (void)setLayout {

  CGSize ScreenSize = [UIScreen mainScreen].bounds.size;
  for (int i = 0; i < 9; i++) {
    UIButton *button = [[UIButton alloc] init];
    [self.view addSubview:button];
    float imagewidth = 100;
    float offsetX =
        (ScreenSize.width - imagewidth * 3) / 2 + imagewidth * (i % 3);
    float offsetY = 200 + (i / 3) * imagewidth;
    button.frame = CGRectMake(offsetX, offsetY, imagewidth, imagewidth);
    UIImage *image =
        [UIImage imageNamed:[NSString stringWithFormat:@"avatar%d", i + 1]];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button addTarget:self
                  action:@selector(lookup:)
        forControlEvents:UIControlEventTouchUpInside];
  }
}

#pragma mark - method
- (void)lookup:(UIButton *)sender {

  currentImageView =
      [[UIImageView alloc] initWithImage:sender.currentBackgroundImage];
  currentFrame = sender.frame;
  PEAToViewController *peatVC = [[PEAToViewController alloc] init];
  peatVC.toimage = sender.currentBackgroundImage;
  peatVC.fromImageFrame = sender.frame;
  [self.navigationController pushViewController:peatVC animated:YES];
}

#pragma mark - UINavigationControllerDelegate
- (id<UIViewControllerAnimatedTransitioning>)
           navigationController:(UINavigationController *)navigationController
animationControllerForOperation:(UINavigationControllerOperation)operation
             fromViewController:(UIViewController *)fromVC
               toViewController:(UIViewController *)toVC {

  PushPEAnimation *transition = [PushPEAnimation new];
  transition.animationDuration = 0.5;
  transition.PEAImageView = currentImageView;
  transition.PEAImageFrame = currentFrame;

  return transition;
}

#pragma mark - getter and setter

@end
