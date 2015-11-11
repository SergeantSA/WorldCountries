//
//  RSVDataModel.h
//  RSVWorldCountry
//
//  Created by SergeantSA on 9/30/15.
//  Copyright (c) 2015 SergeantSoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIImage.h>

@class RSVDataItem;

@protocol RSVDataModelDelegate;

@interface RSVDataModel : NSObject

@property (nonatomic, strong, readonly) NSArray *continents;
@property (nonatomic, weak) id<RSVDataModelDelegate> delegate;

- (NSInteger)continentsCount;
- (NSInteger)countriesCountOn:(NSString *)continent;
- (RSVDataItem *)getCountryOnContinent:(NSString *)continent byIndex:(NSInteger)index;
- (UIImage *)getImageForKey:(NSString *)imageUrlString atIndexPath:(NSIndexPath *)indexPath;

@end

@protocol RSVDataModelDelegate <NSObject>

- (void)reloadCellAtIndexPath:(NSIndexPath *)indexPath;

@end
