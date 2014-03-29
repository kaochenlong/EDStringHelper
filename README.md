Some helpers for NSString.

if you use cocoapods:

    pod 'EDStringHelper'

or else just copy the *.h and *.m to your project.

Method list:

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

Eddie Kao,

eddie@digik.com.tw
