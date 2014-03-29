//
//  NSString+EDStringHelper.m
//  fjjjdfsd
//
//  Created by 高 見龍 on 2014/3/30.
//  Copyright (c) 2014年 高 見龍. All rights reserved.
//

#import "NSString+EDStringHelper.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (EDStringHelper)

/**
 *  check if the string is empty
 */
- (BOOL) isEmpty
{
    return [self.trimmedString isEqualToString:@""];
}

- (BOOL) isNotEmpty
{
    return ![self isEmpty];
}

/**
 *  check if the string is matched with Email format
 */
- (BOOL) isEmail
{
    NSString* emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}";
    NSPredicate* emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:self];
}

- (BOOL) isNotEmail
{
    return ![self isEmail];
}

- (NSString *) trimmedString
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *) truncatedString:(NSUInteger) numberOfCharacters
{
    NSRange stringRange = {0, MIN([self length], numberOfCharacters)};
    stringRange = [self rangeOfComposedCharacterSequencesForRange:stringRange];
    return [self substringWithRange:stringRange];
}

/**
 *  add comma for number
 */
+ (NSString *) numberToThousandSeparatorFormat:(NSInteger) number
{
    NSNumberFormatter* formatter = [[NSNumberFormatter alloc] init];
    formatter.positiveFormat = @"#,###";
    return [formatter stringFromNumber:[NSNumber numberWithInteger:number]];
}

/**
 * MD5 string
 */
- (NSString *) md5String
{
    const char *cStr = [self UTF8String];
    unsigned char digest[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), digest);
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];

    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
    {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return  output;
}

/**
 * SHA1 string
 */
- (NSString *) sha1String
{
    const char* cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData* data = [NSData dataWithBytes:cstr length:self.length];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, (CC_LONG)data.length, digest);
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];

    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
    {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return output;
}

+ (NSString *) randomString:(NSInteger) length
{
    static NSString* letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString* randomString = [NSMutableString stringWithCapacity: length];
    for (int i = 0; i < length; i++)
    {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random() % [letters length]]];
    }
    return randomString;
}
@end
