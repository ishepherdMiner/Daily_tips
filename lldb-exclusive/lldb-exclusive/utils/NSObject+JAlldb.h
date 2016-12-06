//
//  NSObject+JAlldb.h
//  lldb-exclusive
//
//  Created by Jason on 06/12/2016.
//  Copyright © 2016 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (JAlldb)


/**
 属性列表

 @param recursive 是否递归
 @return 属性列表
 */
- (NSArray *)p_propertyList:(BOOL)recursive;

/**
 变量列表

 @param recursive 是否递归
 @return 变量列表
 */
- (NSArray *)p_ivarList:(BOOL)recursive;

/**
 * 方法列表
 *
 * @param recursive 是否递归
 */
- (NSArray *)p_methodList:(BOOL)recursive;


/**
 清空缓存列表
 */
- (void)p_cleanCacheList;

@end
