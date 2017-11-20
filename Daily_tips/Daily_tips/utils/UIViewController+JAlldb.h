//
//  UIViewController+JAlldb.h
//  Daily_tips
//
//  Created by Jason on 29/11/2016.
//  Copyright © 2016 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (JAlldb)

#if DEBUG

/**
 *  输出指定vc的层级结构
 */
- (void)p_recursiveController;

#endif

@end
