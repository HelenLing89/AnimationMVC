//
//  AnimationModel.h
//  古北中央公园
//
//  Created by 凌甜 on 2020/6/29.
//  Copyright © 2020 com.ATT. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AnimationModel : NSObject
@property (nonatomic,strong) NSString *imageStr;
@property (nonatomic,strong) NSString *endStr;
@property (nonatomic,assign) int totalCount;
@property (nonatomic,assign,getter=isRepaat) Boolean repeat;
@property (nonatomic,assign) int repeatPoint;
@property (nonatomic,assign) NSTimeInterval seconds;
@property (nonatomic,assign) NSTimeInterval starts;
@property (nonatomic,assign,getter=isAsyc) Boolean async ;

@end

NS_ASSUME_NONNULL_END
