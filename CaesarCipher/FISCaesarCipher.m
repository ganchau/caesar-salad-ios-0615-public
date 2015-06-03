//
//  FISCaesarCipher.m
//  CaesarCipher
//
//  Created by Chris Gonzales on 5/29/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISCaesarCipher.h"

@implementation FISCaesarCipher
//define methods here
- (NSString *)encodeWithMessage:(NSString *)message andOffset:(NSInteger)key
{
    NSString *encodedMessage = @"";
    for (NSInteger i = 0; i < message.length; i++) {
        
        NSInteger ascii = [message characterAtIndex:i];
        
        if (ascii >= 97 && ascii <= 122) {
            ascii = ascii + (key % 26);
            
            if (ascii > 122) {
                ascii = ascii - 26;
            }
        } else if (ascii >= 65 && ascii <= 90) {
            ascii = ascii + (key % 26);
            
            if (ascii > 90) {
                ascii = ascii - 26;
            }
        }
        
        NSString *encodedLetter = [NSString stringWithFormat:@"%c", ascii];
        encodedMessage = [encodedMessage stringByAppendingString:encodedLetter];
    }

    return encodedMessage;
}

- (NSString *)decodeWithMessage:(NSString *)message andOffset:(NSInteger)key
{
    NSString *decodedMessage = @"";
    for (NSInteger i = 0; i < message.length; i++) {
        
        NSInteger ascii = [message characterAtIndex:i];
        
        if (ascii >= 97 && ascii <= 122) {
            ascii = ascii - (key % 26);
            
            if (ascii < 97) {
                ascii = ascii + 26;
            }
        } else if (ascii >= 65 && ascii <= 90) {
            ascii = ascii - (key % 26);
            
            if (ascii < 65) {
                ascii = ascii + 26;
            }
        }
        
        NSString *decodedLetter = [NSString stringWithFormat:@"%c", ascii];
        decodedMessage = [decodedMessage stringByAppendingString:decodedLetter];
    }
    return decodedMessage;
}

@end
