//
//  UIViewController+JAlldb.m
//  lldb-exclusive
//
//  Created by Jason on 29/11/2016.
//  Copyright © 2016 Jason. All rights reserved.
//

#import "UIViewController+JAlldb.h"

@implementation UIViewController (JAlldb)

#if DEBUG

- (void)p_recursiveController{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    NSLog(@"%@",[self performSelector:@selector(_printHierarchy)]);
    
#pragma clang diagnostic pop
}

#endif

@end
