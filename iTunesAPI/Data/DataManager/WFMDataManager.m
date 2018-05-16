//
//  WFMDataManager.m
//  iTunesAPI
//
//  Created by Kuznetsov Aleksey on 15.05.2018.
//  Copyright © 2018 Kuznetsov Aleksey. All rights reserved.
//

#import "WFMDataManager.h"
#import <AFNetworking.h>

static NSString *const kWFMAPIBaseURL = @"https://itunes.apple.com/";
static NSString *const kWFMMainListURL = @"lookup?amgArtistId=468749,5723&entity=song&limit=50&sort=recent";

static NSString *const kWFMAPIResultsKey = @"results";

NSString *const kWFMStoreListDataArrayKey = @"kWFMStoreListDataArrayKey";

@interface WFMDataManager ()

@property (nonatomic, strong) NSUserDefaults *userDefaults;

@end

@implementation WFMDataManager

#pragma mark - Life Cycle

+ (instancetype)sharedInstance
{
    static WFMDataManager *instance;
    if (!instance) {
        @synchronized (self) {
            if (!instance) {
                instance = [[self alloc] init];
            }
        }
    }
    return instance;
}

- (instancetype)init
{
    if (self = [super init]) {
        self.userDefaults = [NSUserDefaults standardUserDefaults];

    }
    return self;
}

#pragma mark - List Data

- (NSArray *)listDataArray
{
    NSArray *listDataArray = [self objectFromStoreByKey:kWFMStoreListDataArrayKey];
    if (!listDataArray) {
        return @[];
    }
    return listDataArray;
}

- (void)listDataArrayWithBlock:(void (^)(NSArray *array, NSError *error))block
{
    Weakify(self);
    [self loadListDataWithBlock:^(NSArray *array, NSError *error) {
        Strongify(self);
        if (array && !error) {
            [self saveToStoreObject:array forKey:kWFMStoreListDataArrayKey];
        }
        if (block) {
            block(array, error);
        }
    }];
}


#pragma mark - Store

- (id)objectFromStoreByKey:(NSString *)key
{
    return [self.userDefaults objectForKey:key];;
}

- (void)saveToStoreObject:(id)object forKey:(NSString *)key
{
    if (object && key) {
        [self.userDefaults setObject:object forKey:key];
    }
}

- (void)deleteAllSavedData
{
    [self saveToStoreObject:@[] forKey:kWFMStoreListDataArrayKey];
}

#pragma mark - Networking

- (void)loadListDataWithBlock:(void (^)(NSArray *array, NSError *error))block
{
    NSString *URLString = [kWFMAPIBaseURL stringByAppendingString:kWFMMainListURL];
    [self loadDataFromURLString:URLString withBlock:^(id object, NSError *error) {
        if ([object isKindOfClass:[NSDictionary class]]) {
            NSDictionary *responseDictionary = object;
            id results = responseDictionary[kWFMAPIResultsKey];
            if ([results isKindOfClass:[NSArray class]]) {
                if (block) {
                    block(results, nil);
                }
            } else {
                NSError *unknownError = [NSError errorWithDomain:NSURLErrorDomain code:NSURLErrorUnknown userInfo:nil];
                if (block) {
                    block(nil, unknownError);
                }
            }
        } else {
            if (error) {
                if (block) {
                    block(nil, error);
                }
            } else {
                NSError *unknownError = [NSError errorWithDomain:NSURLErrorDomain code:NSURLErrorUnknown userInfo:nil];
                if (block) {
                    block(nil, unknownError);
                }
            }
        }
    }];
}

- (void)loadDataFromURLString:(NSString *)URLString
                    withBlock:(void (^)(id object, NSError *error))block
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:URLString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        if (block) {
            block(responseObject, nil);
        }
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

@end
