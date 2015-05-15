//
//  MyAwesomeClass.m
//  example
//
//  Created by Ryan Copley on 5/15/15.
//  Copyright (c) 2015 Codecov. All rights reserved.
//

#import "MyAwesomeClass.h"

@implementation MyAwesomeClass

+(int)myAwesomeMethod:(BOOL)coverAll {
    int i = 0;
    i++;
    if (!coverAll){
        i++;
    }
    return i;
}


@end
