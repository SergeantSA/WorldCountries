//
//  RSVDataModel.m
//  RSVWorldCountry
//
//  Created by SergeantSA on 9/30/15.
//  Copyright (c) 2015 SergeantSoft. All rights reserved.
//

#import "RSVDataModel.h"
#import "RSVDataItem.h"

@interface RSVDataModel ()

@property (nonatomic, strong) NSMutableDictionary *dataSource;
@property (nonatomic, strong, readwrite) NSArray *continents;
@property (nonatomic, strong) NSOperationQueue *imageOperationQueue;
@property (nonatomic, strong) NSCache *imageCache;

@end

@implementation RSVDataModel

- (instancetype)init
{
    if (self = [super init]) {
        _imageCache = [NSCache new];
        _imageOperationQueue = [NSOperationQueue new];
        _imageOperationQueue.maxConcurrentOperationCount = 4;
        _dataSource = [NSMutableDictionary new];
        [self loadData];
    }
    return self;
}

- (void)loadData
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Countries" ofType:@"plist"];
    NSDictionary *rootDict = [[NSDictionary alloc] initWithContentsOfFile:path];
    for (NSString *continent in rootDict) {
        [self.dataSource setObject:[NSMutableArray new] forKey:continent];
        NSArray *countryArray = rootDict[continent];
        for (NSDictionary *countryInfo in countryArray) {
            [self.dataSource[continent] addObject:[[RSVDataItem alloc] initWithCountryName:countryInfo[@"countryName"] countryLocalName:countryInfo[@"countryLocalName"] capitalName:countryInfo[@"capitalName"] flagURL:countryInfo[@"flagURL"] descriptionURL:countryInfo[@"descriptionURL"]]];
        }
    }
    
   self.continents = [self.dataSource allKeys];
}

- (NSInteger)continentsCount
{
    return self.continents.count;
}

- (NSInteger)countriesCountOn:(NSString *)continent
{
    return [(NSArray *)self.dataSource[continent] count];
}

- (RSVDataItem *)getCountryOnContinent:(NSString *)continent byIndex:(NSInteger)index
{
    NSArray *contriesArray = self.dataSource[continent];
    return contriesArray[index];
}

- (UIImage *)getImageForKey:(NSString *)imageUrlString atIndexPath:(NSIndexPath *)indexPath
{
    UIImage *imageFromCache = [self.imageCache objectForKey:imageUrlString];
    if (imageFromCache) {
        return imageFromCache;
    } else {
        [self.imageOperationQueue addOperationWithBlock:^{
            NSURL *imageURL = [NSURL URLWithString:imageUrlString];
            UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageURL]];
            if (img == nil) {
                img = [UIImage imageNamed:@"failed"];
            }
            [self.imageCache setObject:img forKey:imageUrlString];
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [self.delegate reloadCellAtIndexPath:indexPath];
            }];
        }];
        return nil;
    }
}

@end
