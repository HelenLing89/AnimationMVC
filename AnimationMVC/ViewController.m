//
//  ViewController.m
//  AnimationMVC
//
//  Created by 凌甜 on 2020/6/29.
//  Copyright © 2020 com.ATT. All rights reserved.
//

#import "ViewController.h"
#import "AnimationView.h"
#import "AnimationModel.h"
#import "NewController.h"
@interface ViewController ()
@property (nonatomic,strong) AnimationView *shangAnimationView;
@property (nonatomic,strong) AnimationView *itemAnimationView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor blueColor];
    self.shangAnimationView = [[AnimationView alloc] init];
    self.shangAnimationView.frame = [UIScreen mainScreen].bounds;
    [self.view.layer addSublayer:self.shangAnimationView];
    AnimationModel *animationModel = [AnimationModel new];
    animationModel.imageStr = @"shangL";
    animationModel.endStr = @"png";
    animationModel.async = NO;
    animationModel.repeat = YES;
    animationModel.repeatPoint = 75;
    animationModel.seconds = 0.06;
    animationModel.starts = 0;
    animationModel.totalCount = 150;
    self.shangAnimationView.animationModel = animationModel;
    self.itemAnimationView = [[AnimationView alloc] init];
    self.itemAnimationView.frame = [UIScreen mainScreen].bounds;
    [self.view.layer addSublayer:self.itemAnimationView];
    AnimationModel *animationModel1 = [AnimationModel new];
    animationModel1.imageStr = @"itemL";
    animationModel1.endStr = @"png";
    animationModel1.async = NO;
    animationModel1.repeat = YES;
    animationModel1.repeatPoint = 75;
    animationModel1.seconds = 0.06;
    animationModel1.starts = 0;
    animationModel1.totalCount = 150;
    self.itemAnimationView.animationModel = animationModel1;
    [self addBtn];
}

- (void)addBtn {
    for (NSInteger index = 0; index < 2; index++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50+150*index, 50, 100, 100)];
        [btn setTitle:[NSString stringWithFormat:@"%ld",index] forState:UIControlStateNormal];
        [self.view addSubview:btn];
        [btn setTintColor:[UIColor redColor]];
        btn.tag = index;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)btnClick:(UIButton *)btn {
    if (btn.tag == 0) {
        self.itemAnimationView.hidden = YES;
        self.shangAnimationView.hidden = NO;
        [self.itemAnimationView animationEnd];
        [self.shangAnimationView animationBegin];
    }else if (btn.tag == 1) {
        self.shangAnimationView.hidden = YES;
        self.itemAnimationView.hidden = NO;
        [self.shangAnimationView animationEnd];
        [self.itemAnimationView animationBegin];
    }
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.shangAnimationView animationEnd];
    [self.itemAnimationView animationEnd];
    NewController *new = [NewController new];
    new.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:new animated:NO completion:nil];
}

- (void)dealloc {
    [self.shangAnimationView animationEnd];
    [self.itemAnimationView animationEnd];
    NSLog(@"%s",__func__);
}


@end
