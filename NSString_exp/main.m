//
//  main.m
//  NSString_exp
//
//  Created by admin on 4/6/17.
//  Copyright © 2017 admin. All rights reserved.
//  http://www.techotopia.com/index.php/Working_with_String_Objects_in_Objective-C

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        char *myString = "This is a C character string";
        char myStringArray[] = "This is a C character string";
        
        NSLog(@"Length myStringArray[] %lu", sizeof(myStringArray)/sizeof(*myStringArray)); //29
        NSLog(@"Length myString %lu", strlen(myString)); //28
        
        NSLog(@"%@", @"This is a constant character string object");
        int lenOfString = (int)[@"This is a constant character string object" length];
        NSLog(@"Legth of string = %i", lenOfString);
        
        NSString *str1 = @"This string is immutable";
        NSMutableString *str2 = [NSMutableString stringWithString:@"This string is mutable"];
        NSLog(@"str1 adr. = %p", str1); //0x100001120
        NSLog(@"str2 adr/ = %p", str2); //0x100204e30
        
        NSMutableString *string1;
        NSMutableString *string2;
        
        //----------------------------------------------------------------
        string1 = [NSMutableString stringWithString:@"This is a string"];
        string2 = string1;
        
        NSLog(@"string1 adr. = %p", string1); //0x1005002a0
        NSLog(@"string2 adr. = %p", string2); //0x1005002a0
        
        [string2 appendString:@" and it is mine! "];
        NSLog(@"string1 = %@", string1); //This is a string and it is mine!
        NSLog(@"string2 = %@", string2); //This is a string and it is mine!
        
        //----------------------------------------------------------------
        NSMutableString *string11;
        NSMutableString *string22;
        
        string11 = [NSMutableString stringWithString:@"This is a string"];
        string22 = [NSMutableString stringWithString:string11];
        
        [string22 appendString:@" and it is mine!"];
        NSLog(@"string11 = %@", string11); //This is a string
        NSLog(@"string22 = %@", string22); //This is a string and it is mine!
        NSLog(@"string11 adr. = %p", string11); //0x1005005f0
        NSLog(@"string22 adr. = %p", string22); //0x100500630


        //----------Searching for a Substring-----------------------------
        /*
         typedef struct _NSRange {
         NSUInteger location;
         NSUInteger length;
         } NSRange;
         */
        NSMutableString *string111 = [NSMutableString stringWithString:@"The quick brown fox jumped"];
        NSRange match;
        match = [string111 rangeOfString:@"brown"];
        if (match.location == NSNotFound) {
            NSLog(@"Match not found");
        } else {
            NSLog(@"Match found at index %lu, length %lu", match.location, match.length);
            NSLog(@"old string111 = %@", string111);
            NSLog(@"new string111 = %@", [string111 stringByReplacingCharactersInRange:match withString:@"YELLOW"]);
        }
        
        //--------Deleting section of a string--------------------------
        [string111 deleteCharactersInRange:[string111 rangeOfString:@"quick"]];
        NSLog(@"Delete string quik - %@", string111);
        
        //--------Exstracting a subsection of a String------------------
        NSMutableString *string222 = [NSMutableString stringWithString:@"The quick brown fox jumped"];
        NSString *string223;
        
        string223 = [string222  substringWithRange:NSMakeRange(4, 5)];
        NSLog(@"string223 = %@", string223);
        
        //--------Inserting text into String-----------------------------
        NSMutableString *string333 = [NSMutableString stringWithString:@"The quick brown fox jumped"];
        NSLog(@" string333 = %@", string333);
        [string333 insertString:@"agile " atIndex:4];
        NSLog(@" string333 = %@", string333);
        
        //--------Append text to the end of a string---------------------
        NSMutableString *string4 = [NSMutableString stringWithString:@"The quick brown fox jumped"];
        NSLog(@"string4 = %@", string4);
        [string4 appendString:@" over the lazy dog"];
        NSLog(@"string4 = %@", string4);
        
        //--------Comparing string---------------------------------------
        const char *chString1 = "My String 1";
        const char *chString2 = "My String 2";
        NSString *str11 = [NSString stringWithUTF8String: chString1];
        NSString *str22 = [NSString stringWithUTF8String: chString2];
        
        if ([str11 isEqualToString:str22]) {
            NSLog(@"Strings match");
        } else {
            NSLog(@"Strings do not match");
        }
        
        
    }
    return 0;
}
