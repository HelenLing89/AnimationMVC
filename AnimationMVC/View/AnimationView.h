//
//  AnimationView.h
//  古北中央公园
//
//  Created by 凌甜 on 2020/6/29.
//  Copyright © 2020 com.ATT. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
@class AnimationModel;

@interface AnimationView : CALayer
@property (nonatomic,strong) AnimationModel *animationModel;

- (void)animationBegin;

- (void)animationEnd;
@end

