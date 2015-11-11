//
//  RSVCountryInfoCell.h
//  RSVWorldCountry
//
//  Created by SergeantSA on 9/30/15.
//  Copyright (c) 2015 SergeantSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RSVDataModel;

@interface RSVCountryInfoCell : UITableViewCell

@property (nonatomic, weak) RSVDataModel *dataModel;

- (void)configureCellAtIndexPath:(NSIndexPath *)indexPath;

@end
