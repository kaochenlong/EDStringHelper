//
//  NSString+EDStringHelper.h
//  fjjjdfsd
//
//  Created by 高 見龍 on 2014/3/30.
//  Copyright (c) 2014年 高 見龍. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (EDStringHelper)

- (BOOL) isEmpty;
- (BOOL) isNotEmpty;
- (BOOL) isEmail;
- (BOOL) isNotEmail;
- (NSString *) trimmedString;
- (NSString *) truncatedString:(NSUInteger) numberOfCharacters;
- (NSString *) md5String;
- (NSString *) sha1String;
+ (NSString *) randomString:(NSInteger) length;
+ (NSString *) numberToThousandSeparatorFormat:(NSInteger) number;

@end
