//
//  NSObject+JAlldb.m
//  Daily_tips
//
//  Created by Jason on 06/12/2016.
//  Copyright © 2016 Jason. All rights reserved.
//

#import "NSObject+JAlldb.h"
#import <objc/message.h>

@implementation NSObject (JAlldb)

const void* propertiesKey = "com.coder.Daily_tips.propertiesKey";
const void* ivarKey = "com.coder.Daily_tips.ivarKey";
const void* methodKey = "com.coder.Daily_tips.methodKey";

- (NSArray *)p_propertyList:(BOOL)recursive {
    
    NSArray *glist = objc_getAssociatedObject([self class], propertiesKey);

    return glist == nil ? ^{
        
        unsigned int count = 0;
        NSMutableArray *plistM = [NSMutableArray arrayWithCapacity:count];
        
        Class cls = [self class];
        do {
            objc_property_t *list = class_copyPropertyList(cls, &count);
            for (int i = 0; i < count; ++i) {
                objc_property_t pty = list[i];
                const char *pname = property_getName(pty);
                [plistM addObject:[NSString stringWithUTF8String:pname]];
            }
            free(list);
            cls = [cls superclass];
        } while (cls && recursive);
        objc_setAssociatedObject([self class],propertiesKey, plistM, OBJC_ASSOCIATION_COPY_NONATOMIC);
        NSLog(@"Found %ld properties on %@",plistM.count,[self class]);
        return plistM.copy;
        
    }() : glist;
}

- (NSArray *)p_ivarList:(BOOL)recursive{
    
    NSArray *glist = objc_getAssociatedObject([self class], ivarKey);
    
    return glist == nil ? ^{
        
        unsigned int count = 0;
        NSMutableArray *plistM = [NSMutableArray arrayWithCapacity:count];
        
        Class cls = [self class];
        do {
            Ivar *list = class_copyIvarList(cls, &count);
            for (int i = 0; i < count; ++i) {
                Ivar ity = list[i];
                const char *iname = ivar_getName(ity);
                [plistM addObject:[NSString stringWithUTF8String:iname]];
            }
            free(list);
            cls = [cls superclass];
        } while (cls && recursive);
        
        NSLog(@"Found %ld ivar on %@",plistM.count,[self class]);
        objc_setAssociatedObject([self class],ivarKey, plistM, OBJC_ASSOCIATION_COPY_NONATOMIC);
        return plistM.copy;
        
    }() : glist;
}

- (NSArray *)p_methodList:(BOOL)recursive {
    
    NSArray *glist = objc_getAssociatedObject([self class], methodKey);
    
    return glist == nil ? ^{
        
        unsigned int methodCount = 0;
        NSMutableArray *plistM = [NSMutableArray arrayWithCapacity:methodCount];
        
        Class cls = [self class];
        do {
            Method *methods = class_copyMethodList(cls, &methodCount);
            
            for (unsigned int i = 0; i < methodCount; i++) {
                Method method = methods[i];
            
                /*
                printf("\t'%s'|'%s' of encoding '%s'\n",
                       class_getName(cls),
                       sel_getName(method_getName(method)),
                       method_getTypeEncoding(method));
                */
                [plistM addObject:[NSString stringWithUTF8String:sel_getName(method_getName(method))]];
            }
            free(methods);
            cls = [cls superclass];
        }while (cls && recursive);
        printf("Found %d methods on '%s'\n", methodCount, class_getName([self class]));
        objc_setAssociatedObject([self class],ivarKey, plistM, OBJC_ASSOCIATION_COPY_NONATOMIC);
        
        return plistM.copy;
        
    }() : glist;
}

- (void)p_cleanCacheList {
    objc_removeAssociatedObjects([self class]);
}

@end
