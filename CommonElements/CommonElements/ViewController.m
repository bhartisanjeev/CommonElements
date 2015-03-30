//
//  ViewController.m
//  CommonElements
//
//  Created by Sanjeev Bharti on 3/25/15.
//  Copyright (c) 2015 Sanjeev Bharti. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (void)swapElementsWithArray:(NSMutableArray *)arrListOfElementsToSort Start:(NSInteger)start andEndIndex:(NSInteger)end ;

- (NSInteger)calculatePivotInArray:(NSMutableArray *)elementsList withStart:(NSInteger)start endIndex:(NSInteger)end andPivot:(NSInteger)pivot ;

- (NSMutableArray *)fillRandomElementsIntoArray:(NSMutableArray *)arrListOfToFill ;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    arrListA = [self fillRandomElementsIntoArray:arrListA];
    [self sortArray:arrListA withStart:0 andEnd:arrListA.count - 1];
    self.lblToDisplayListA.text = [arrListA componentsJoinedByString:@", "];
    
    arrListB = [self fillRandomElementsIntoArray:arrListB];
    [self sortArray:arrListB withStart:0 andEnd:arrListB.count - 1];
    self.lblToDisplayListB.text = [arrListB componentsJoinedByString:@", "];
    
    int aCounter = 0 ;
    int bCounter = 0 ;
    
    NSMutableArray *_arrayCommonElements = [[NSMutableArray alloc] init];
    
    while (aCounter < arrListA.count && bCounter < arrListB.count) {
        
        if ([[arrListA objectAtIndex:aCounter] isEqual:[arrListB objectAtIndex:bCounter]]) {
            
            [_arrayCommonElements addObject:[arrListA objectAtIndex:aCounter]];
            
             bCounter++ ;
             aCounter++ ;
        } else if ([[arrListA objectAtIndex:aCounter] integerValue] > [[arrListB objectAtIndex:bCounter] integerValue]) {
            
            bCounter++ ;
            
        } else {
            
            aCounter++ ;
        }
        
    } //while loop closed
    
    self.lblToDisplayCommonList.text = [_arrayCommonElements componentsJoinedByString:@", "];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - Quick Sort To sort Array Elements

- (void)sortArray:(NSMutableArray *)elementsList withStart:(NSInteger)start andEnd:(NSInteger)end {
    
    if (start > end) return ;
    
    NSInteger pivot = [self calculatePivotInArray:elementsList withStart:start endIndex:end andPivot:start];
    
    [self sortArray:elementsList withStart:start andEnd:pivot - 1];
    [self sortArray:elementsList withStart:pivot+1 andEnd:end];
}

#pragma mark -
#pragma mark - Private Methods related to quick sort

- (NSInteger)calculatePivotInArray:(NSMutableArray *)elementsList withStart:(NSInteger)start endIndex:(NSInteger)end andPivot:(NSInteger)pivot {
    
    while (start != end) {
        
        if (pivot == start) {
            // we will start from right
            
            if ([[elementsList objectAtIndex:pivot] integerValue] < [[elementsList objectAtIndex:end] integerValue]) end-- ;
            
            else {
                
                [self swapElementsWithArray:elementsList Start:pivot andEndIndex:end];
                start++ ;
                pivot = end ;
            }
            
        } else {
            // we will start from left
            
            if ([[elementsList objectAtIndex:pivot] integerValue] > [[elementsList objectAtIndex:start] integerValue]) start++ ;
            
            else {
                [self swapElementsWithArray:elementsList Start:pivot andEndIndex:start];
                end-- ;
                pivot = start ;
            }
        }
    }
    
    return pivot ;
}

- (void)swapElementsWithArray:(NSMutableArray *)arrListOfElementsToSort Start:(NSInteger)start andEndIndex:(NSInteger)end {
    
    NSInteger valueOfStart  = [[arrListOfElementsToSort objectAtIndex:start] integerValue];
    NSInteger valueOfEnd    = [[arrListOfElementsToSort objectAtIndex:end] integerValue];
    
    valueOfStart    = valueOfStart + valueOfEnd ;
    valueOfEnd      = valueOfStart - valueOfEnd ;
    valueOfStart    = valueOfStart - valueOfEnd ;
    
    [arrListOfElementsToSort replaceObjectAtIndex:start withObject:[NSNumber numberWithInteger:valueOfStart]];
    [arrListOfElementsToSort replaceObjectAtIndex:end withObject:[NSNumber numberWithInteger:valueOfEnd]];
    
}


#pragma mark -
#pragma mark - Other methods

- (NSMutableArray *)fillRandomElementsIntoArray:(NSMutableArray *)arrListOfToFill {
    
    if (!arrListOfToFill) {
        arrListOfToFill = [[NSMutableArray alloc] init];
    }
    
    [arrListOfToFill removeAllObjects];
    
    int n = 50 ;
    
    while (n-- > 0) [arrListOfToFill addObject:[NSNumber numberWithInteger:arc4random() % 50]] ;
    
    return arrListOfToFill ;
//    NSLog(@"Unsorted array  = %@",arrListOfToFill);
}


@end
