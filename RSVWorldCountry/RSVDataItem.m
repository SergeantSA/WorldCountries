//
//  RSVDataItem.m
//  RSVWorldCountry
//
//  Created by SergeantSA on 9/30/15.
//  Copyright (c) 2015 SergeantSoft. All rights reserved.
//

#import "RSVDataItem.h"

@implementation RSVDataItem

- (instancetype)initWithCountryName:(NSString *)countryName countryLocalName:(NSString *)countryLocalName capitalName:(NSString *)capitalName flagURL:(NSString *)flagURL descriptionURL:(NSString *)descriptionURL
{
    if (self = [super init]) {
        _countryName = countryName;
        _countryLocalName = countryLocalName;
        _capitalName = capitalName;
        _flagURL = flagURL;
        _descriptionURL = descriptionURL;
    }
    return self;
}

@end
