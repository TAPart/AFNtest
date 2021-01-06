//
//  AFNViewController.m
//  AFNtest
//
//  Created by Ra2212 on 01/06/2021.
//  Copyright (c) 2021 Ra2212. All rights reserved.
//

#import "AFNViewController.h"
#import <AFNtest/NSGetDataTools.h>

@interface AFNViewController ()

@end

@implementation AFNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    [NSGetDataTools getWaPhotoData:@"http://192.168.0.235:8765/api/system/configs" SuccessBlock:^(NSDictionary *dict) {
            
        NSLog(@"%@", dict);
    } failureBlock:^(NSError *error) {
            
        NSLog(@"%@", error);

    }];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
