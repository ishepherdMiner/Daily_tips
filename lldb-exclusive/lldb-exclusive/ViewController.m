//
//  ViewController.m
//  lldb-exclusive
//
//  Created by Jason on 29/11/2016.
//  Copyright © 2016 Jason. All rights reserved.
//

#import "ViewController.h"
#import "JAExclusive.h"

@interface ViewController ()
@property (copy,nonatomic) NSString *abc;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view p_propertyList:false];
    [self.view p_propertyList:true];
    [self.view p_cleanCacheList];
    [self.view p_propertyList:true];
    
    [self p_methodList:true];
    [self p_cleanCacheList];
    [UIViewController p_methodList:true];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
