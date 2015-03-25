//
//  ViewController.m
//  CommonElements
//
//  Created by Sanjeev Bharti on 3/25/15.
//  Copyright (c) 2015 Sanjeev Bharti. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSMutableArray *listA = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:10],[NSNumber numberWithInt:20],[NSNumber numberWithInt:30],[NSNumber numberWithInt:40],[NSNumber numberWithInt:50],[NSNumber numberWithInt:60],[NSNumber numberWithInt:70], nil];
    
    NSMutableArray *listB = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:30],[NSNumber numberWithInt:40],[NSNumber numberWithInt:60], nil];
    
    int aCounter = 0 ;
    int bCounter = 0 ;
    
    while (aCounter < listA.count && bCounter < listB.count) {
        
        if ([[listA objectAtIndex:aCounter] isEqual:[listB objectAtIndex:bCounter]]) {
            
            NSLog(@"Element present in both arrays = %@",[listA objectAtIndex:aCounter]);
             bCounter++ ;
             aCounter++ ;
        } else if ([[listA objectAtIndex:aCounter] integerValue] > [[listB objectAtIndex:bCounter] integerValue]) {
            
            bCounter++ ;
            
        } else {
            
            aCounter++ ;
        }
        
    } //while loop closed
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
