OBJC_EXTERN CFStringRef MGCopyAnswer(CFStringRef key) WEAK_IMPORT_ATTRIBUTE;
#include <CommonCrypto/CommonDigest.h>

@implementation NSString (MD5)
+ (NSString*)md5:(NSString*)input {
    const char* str = [input UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, strlen(str), result);

    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
	[ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}
+(NSString *)udid {
    CFStringRef UDID = MGCopyAnswer(CFSTR("UniqueDeviceID"));
    return (NSString *)UDID;
}
@end

int main() {

NSFileManager *manager = [[[NSFileManager alloc] init] autorelease];
NSString *lice = @"/var/mobile/Library/Preferences/com.apple.experience.kuth.plist";

NSString *dp_hash_md5 = [NSString md5:[NSString stringWithFormat:@"cun_%@_%@_stuck_%@", @"dispatch", @"key1", [NSString udid]]];
NSString *dp_hash = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@",
 [dp_hash_md5 substringToIndex:2],
 [[dp_hash_md5 substringToIndex:6]  substringFromIndex:4],
 [[dp_hash_md5 substringToIndex:10] substringFromIndex:8],
 [[dp_hash_md5 substringToIndex:14] substringFromIndex:12],
 [[dp_hash_md5 substringToIndex:18] substringFromIndex:16],
 [[dp_hash_md5 substringToIndex:22] substringFromIndex:20],
 [[dp_hash_md5 substringToIndex:26] substringFromIndex:24],
 [[dp_hash_md5 substringToIndex:30] substringFromIndex:28]
 ];

NSString *dp_key_md5 = [NSString md5:[NSString stringWithFormat:@"cun_%@_%@_stuck_%@", @"dispatch", @"key_cunstuck", [NSString udid]]];
NSString *dp_key = [NSString stringWithFormat:@"%@%@%@%@",
 [dp_key_md5 substringToIndex:2],
 [[dp_key_md5 substringToIndex:10]  substringFromIndex:8],
 [[dp_key_md5 substringToIndex:18] substringFromIndex:16],
 [[dp_key_md5 substringToIndex:26] substringFromIndex:24]
 ];

NSString *dp_token1_md5 = [NSString md5:[NSString stringWithFormat:@"cun_%@_%@_stuck_%@", @"dp", @"token_hash", dp_hash]];
NSString *dp_token2_md5 = [NSString md5:[NSString stringWithFormat:@"cun_%@_%@_stuck_%@", @"dp", @"token_key", dp_key]];
NSString *dp_token = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@",
 [dp_token1_md5 substringToIndex:2],
 [[dp_token1_md5 substringToIndex:6]  substringFromIndex:4],
 [[dp_token1_md5 substringToIndex:10] substringFromIndex:8],
 [[dp_token1_md5 substringToIndex:14] substringFromIndex:12],
 [[dp_token1_md5 substringToIndex:18] substringFromIndex:16],
 [[dp_token1_md5 substringToIndex:22] substringFromIndex:20],
 [[dp_token1_md5 substringToIndex:26] substringFromIndex:24],
 [[dp_token1_md5 substringToIndex:30] substringFromIndex:28],
 [dp_token2_md5 substringToIndex:2],
 [[dp_token2_md5 substringToIndex:6]  substringFromIndex:4],
 [[dp_token2_md5 substringToIndex:10] substringFromIndex:8],
 [[dp_token2_md5 substringToIndex:14] substringFromIndex:12],
 [[dp_token2_md5 substringToIndex:18] substringFromIndex:16],
 [[dp_token2_md5 substringToIndex:22] substringFromIndex:20],
 [[dp_token2_md5 substringToIndex:26] substringFromIndex:24],
 [[dp_token2_md5 substringToIndex:30] substringFromIndex:28]
 ];
 
NSString *hash_md5 = [NSString md5:[NSString stringWithFormat:@"cun_%@_%@_stuck_%@", @"LocationChanger", @"Cunstuck",  [NSString udid]]];
NSString *hash = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@",
 [hash_md5 substringToIndex:2],
 [[hash_md5 substringToIndex:6]  substringFromIndex:4],
 [[hash_md5 substringToIndex:10] substringFromIndex:8],
 [[hash_md5 substringToIndex:14] substringFromIndex:12],
 [[hash_md5 substringToIndex:18] substringFromIndex:16],
 [[hash_md5 substringToIndex:22] substringFromIndex:20],
 [[hash_md5 substringToIndex:26] substringFromIndex:24],
 [[hash_md5 substringToIndex:30] substringFromIndex:28]
 ];

NSString *key_md5 = [NSString md5:[NSString stringWithFormat:@"cun_%@_stuck_%@", @"KEY", [NSString udid]]];
NSString *key = [NSString stringWithFormat:@"%@%@%@%@",
 [key_md5 substringToIndex:2],
 [[key_md5 substringToIndex:10]  substringFromIndex:8],
 [[key_md5 substringToIndex:18] substringFromIndex:16],
 [[key_md5 substringToIndex:26] substringFromIndex:24]
 ];

NSString *token1_md5 = [NSString md5:[NSString stringWithFormat:@"cun_%@_%@_stuck_%@", @"token", @"hash", hash]];
NSString *token2_md5 = [NSString md5:[NSString stringWithFormat:@"cun_%@_%@_stuck_%@", @"token", @"key", key]];
NSString *token = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@",
 [token1_md5 substringToIndex:2],
 [[token1_md5 substringToIndex:6]  substringFromIndex:4],
 [[token1_md5 substringToIndex:10] substringFromIndex:8],
 [[token1_md5 substringToIndex:14] substringFromIndex:12],
 [[token1_md5 substringToIndex:18] substringFromIndex:16],
 [[token1_md5 substringToIndex:22] substringFromIndex:20],
 [[token1_md5 substringToIndex:26] substringFromIndex:24],
 [[token1_md5 substringToIndex:30] substringFromIndex:28],
 [token2_md5 substringToIndex:2],
 [[token2_md5 substringToIndex:6]  substringFromIndex:4],
 [[token2_md5 substringToIndex:10] substringFromIndex:8],
 [[token2_md5 substringToIndex:14] substringFromIndex:12],
 [[token2_md5 substringToIndex:18] substringFromIndex:16],
 [[token2_md5 substringToIndex:22] substringFromIndex:20],
 [[token2_md5 substringToIndex:26] substringFromIndex:24],
 [[token2_md5 substringToIndex:30] substringFromIndex:28]
 ];
 

if (![manager fileExistsAtPath:lice]) {
NSDictionary *dict = [NSDictionary dictionary];
[dict writeToFile:lice atomically:YES];}

NSMutableDictionary *LocationFakerCheck=[[NSMutableDictionary alloc] initWithContentsOfFile:lice];
    [LocationFakerCheck setValue:dp_hash forKey:@"dp_hash"];
	[LocationFakerCheck setValue:dp_key forKey:@"dp_key"];
	[LocationFakerCheck setValue:dp_token forKey:@"dp_token"];
	[LocationFakerCheck setValue:hash forKey:@"hash"];
	[LocationFakerCheck setValue:key forKey:@"key"];
	[LocationFakerCheck setValue:token forKey:@"token"];
[LocationFakerCheck writeToFile:lice atomically:YES];
 
 NSDictionary *permission_prefs = [NSDictionary dictionaryWithObjectsAndKeys:
 @"mobile", NSFileOwnerAccountName,
 @"mobile", NSFileGroupOwnerAccountName,
 [NSNumber numberWithUnsignedLong:0644], NSFilePosixPermissions, nil];
[manager setAttributes:permission_prefs ofItemAtPath:lice error:nil];

printf("\n");
printf("Respring!!!\n");
printf("Respring!!!\n");
printf("Respring!!!\n");
printf("\n");
printf("*** Keygen CCQuick Pro by julioverne ***\n");
printf("\n");
}