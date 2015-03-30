//
//  ViewController.h
//  CommonElements
//
//  Created by Sanjeev Bharti on 3/25/15.
//  Copyright (c) 2015 Sanjeev Bharti. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    
    NSMutableArray *arrListA ;
    NSMutableArray *arrListB ;
    
}

- (void)sortArray:(NSMutableArray *)elementsList withStart:(NSInteger)start andEnd:(NSInteger)end ;


@end

