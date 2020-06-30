//
//  LTProxy.h
//  古北中央公园
//
//  Created by 凌甜 on 2020/6/22.
//  Copyright © 2020 com.ATT. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LTProxy : NSProxy
+ (instancetype)proxyWithTarget:(id)target;
@property (nonatomic,weak) id target;
@end

NS_ASSUME_NONNULL_END
