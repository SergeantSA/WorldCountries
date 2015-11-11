//
//  RSVDataItem.h
//  RSVWorldCountry
//
//  Created by SergeantSA on 9/30/15.
//  Copyright (c) 2015 SergeantSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSVDataItem : NSObject

@property(nonatomic, copy, readonly) NSString *countryName;
@property(nonatomic, copy, readonly) NSString *countryLocalName;
@property(nonatomic, copy, readonly) NSString *capitalName;
@property(nonatomic, copy, readonly) NSString *flagURL;
@property(nonatomic, copy, readonly) NSString *descriptionURL;

- (instancetype)initWithCountryName:(NSString *)countryName countryLocalName:(NSString *)countryLocalName capitalName:(NSString *)capitalName flagURL:(NSString *)flagURL descriptionURL:(NSString *)descriptionURL NS_DESIGNATED_INITIALIZER;

@end
