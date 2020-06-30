//
//  AnimationView.m
//  古北中央公园
//
//  Created by 凌甜 on 2020/6/29.
//  Copyright © 2020 com.ATT. All rights reserved.
//

#import "AnimationView.h"
#import "LTTimer.h"
#import "AnimationModel.h"
@interface AnimationView()
@property (nonatomic,strong) NSString *timer;
@property (nonatomic,assign) NSInteger num;
@end
@implementation AnimationView

- (void)setAnimationModel:(AnimationModel *)animationModel {
    _animationModel = animationModel;
}

- (void)animationBegin {
    if (_timer.length != 0) {
        [self animationEnd];
    }
    self.timer = [LTTimer execTask:self selector:@selector(imageVChange) start:self.animationModel.starts interval:self.animationModel.seconds repeats:self.animationModel.repeat async:self.animationModel.async];
    self.num = 0;
}

- (void)imageVChange {
    NSString * path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@_%ld.%@",self.animationModel.imageStr,(long)self.num, self.animationModel.endStr] ofType:nil];
    self.contents= (__bridge id _Nullable)([UIImage imageWithContentsOfFile:path].CGImage);
    NSLog(@"%@",self.animationModel.imageStr);
    self.num ++;
    if (self.num > self.animationModel.totalCount) {
        if (self.animationModel.repeat == YES) {
            self.num = self.animationModel.repeatPoint;
        }else {
            [self animationEnd];
        }
    }
}

- (void)animationEnd {
    [LTTimer cancelTask:self.timer];
    _timer = nil;
}


- (void)dealloc {
    NSLog(@"%s",__func__);
}


@end
