//
//  main.m
//  NSString_exp
//
//  Created by admin on 4/6/17.
//  Copyright © 2017 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        char *myString = "This is a C character string";
        char myStringArray[] = "This is a C character string";
        
        NSLog(@"Length myStringArray[] %lu", sizeof(myStringArray)/sizeof(*myStringArray)); //29
        NSLog(@"Length myString %lu", strlen(myString)); //28
    }
    return 0;
}
