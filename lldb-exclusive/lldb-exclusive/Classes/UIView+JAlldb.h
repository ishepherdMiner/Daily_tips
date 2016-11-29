//
//  UIView+lldb.h
//  lldb-exclusive
//
//  Created by Jason on 29/11/2016.
//  Copyright © 2016 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JAlldb)

#if DEBUG

/**
 *  输出view的层级结构
 */
- (void)p_recursiveView;

#endif

@end
