//
//  LTProxy.m
//  古北中央公园
//
//  Created by 凌甜 on 2020/6/22.
//  Copyright © 2020 com.ATT. All rights reserved.
//

#import "LTProxy.h"

@implementation LTProxy
+ (instancetype)proxyWithTarget:(id)target {
    LTProxy *proxy = [LTProxy alloc];
    proxy.target = target;
    return proxy;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    [invocation invokeWithTarget:self.target];
}

@end
