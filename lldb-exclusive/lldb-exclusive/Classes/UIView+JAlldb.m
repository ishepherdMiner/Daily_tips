//
//  UIView+lldb.m
//  lldb-exclusive
//
//  Created by Jason on 29/11/2016.
//  Copyright © 2016 Jason. All rights reserved.
//

#import "UIView+JAlldb.h"

@implementation UIView (lldb)

#if DEBUG

- (void)p_recursiveView{
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    
    NSLog(@"%@",[self performSelector:@selector(recursiveDescription)]);
    
#pragma clang diagnostic pop
}

#endif

@end
