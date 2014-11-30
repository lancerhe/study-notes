> 转载自：<http://www.cnblogs.com/wanyakun/p/3403352.html>

最近的项目中数据传输用到加密，项目选择了AES128 CBC No Padding加密方式，PHP和Android方面的代码网上太多了。但是唯独没有iOS的，但是也有别的写法，但不是是AES128 CBC No Padding或者不是CBC No Padding。自己仿照着写了个，不过PHP端总是解密不出。问题就处在No Padding. No Pading的情况下，一定要对加密数据不是kCCKeySizeAES128倍数部分进行0x0000的填充，不然加密长度不正确，一般情况下选择使用kCCOptionPKCS7Padding（也就是0x0001）进行填充，但是我们是No Padding所以要用0x0000填充。加密后再对加密数据进行了Base64加密，用到了google的GTMBase64，没有的网上自己找，下面上ios的代码： DES3Util.h内容
```c
//
//  DES3Util.h
//  JuziAnalyticsDemo
//
//  Created by wanyakun on 13-6-6.
//  Copyright (c) 2013年 The9. All rights reserved.
//
 
#import <Foundation/Foundation.h>
 
@interface DES3Util : NSObject
 
+ (NSString*) AES128Encrypt:(NSString *)plainText;
 
+ (NSString*) AES128Decrypt:(NSString *)encryptText;
 
@end
DES3Util.m文件内容
//
//  DES3Util.m
//  JuziAnalyticsDemo
//
//  Created by wanyakun on 13-6-6.
//  Copyright (c) 2013年 The9. All rights reserved.
//
 
#import "DES3Util.h"
#import <CommonCrypto/CommonCryptor.h>
#import "GTMBase64.h"
 
#define gkey            @"16位长度的字符串" //自行修改
#define gIv             @"16位长度的字符串" //自行修改
 
@implementation DES3Util
 
+(NSString *)AES128Encrypt:(NSString *)plainText
{
    char keyPtr[kCCKeySizeAES128+1];
    memset(keyPtr, 0, sizeof(keyPtr));
    [gkey getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
 
    char ivPtr[kCCBlockSizeAES128+1];
    memset(ivPtr, 0, sizeof(ivPtr));
    [gIv getCString:ivPtr maxLength:sizeof(ivPtr) encoding:NSUTF8StringEncoding];
 
    NSData* data = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [data length];
 
    int diff = kCCKeySizeAES128 - (dataLength % kCCKeySizeAES128);
    int newSize = 0;
 
    if(diff > 0)
    {
        newSize = dataLength + diff;
    }
 
    char dataPtr[newSize];
    memcpy(dataPtr, [data bytes], [data length]);
    for(int i = 0; i < diff; i++)
    {
        dataPtr[i + dataLength] = 0x00;
    }
 
    size_t bufferSize = newSize + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    memset(buffer, 0, bufferSize);
 
    size_t numBytesCrypted = 0;
 
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmAES128,
                                          0x0000,               //No padding
                                          keyPtr,
                                          kCCKeySizeAES128,
                                          ivPtr,
                                          dataPtr,
                                          sizeof(dataPtr),
                                          buffer,
                                          bufferSize,
                                          &numBytesCrypted);
 
    if (cryptStatus == kCCSuccess) {
        NSData *resultData = [NSData dataWithBytesNoCopy:buffer length:numBytesCrypted];
        return [GTMBase64 stringByEncodingData:resultData];
    }
    free(buffer);
    return nil;
}
 
+(NSString *)AES128Decrypt:(NSString *)encryptText
{
    char keyPtr[kCCKeySizeAES128 + 1];
    memset(keyPtr, 0, sizeof(keyPtr));
    [gkey getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
 
    char ivPtr[kCCBlockSizeAES128 + 1];
    memset(ivPtr, 0, sizeof(ivPtr));
    [gIv getCString:ivPtr maxLength:sizeof(ivPtr) encoding:NSUTF8StringEncoding];
 
    NSData *data = [GTMBase64 decodeData:[encryptText dataUsingEncoding:NSUTF8StringEncoding]];
    NSUInteger dataLength = [data length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
 
    size_t numBytesCrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmAES128,
                                          0x0000,
                                          keyPtr,
                                          kCCBlockSizeAES128,
                                          ivPtr,
                                          [data bytes],
                                          dataLength,
                                          buffer,
                                          bufferSize,
                                          &numBytesCrypted);
    if (cryptStatus == kCCSuccess) {
        NSData *resultData = [NSData dataWithBytesNoCopy:buffer length:numBytesCrypted];
        return [[[NSString alloc] initWithData:resultData encoding:NSUTF8StringEncoding] autorelease];
    }
    free(buffer);
    return nil;
}
@end
```