//
//  RSVCountryInfoCell.m
//  RSVWorldCountry
//
//  Created by SergeantSA on 9/30/15.
//  Copyright (c) 2015 SergeantSoft. All rights reserved.
//

#import "RSVCountryInfoCell.h"
#import "RSVDataModel.h"
#import "RSVDataItem.h"

@interface RSVCountryInfoCell ()

@property (weak, nonatomic) IBOutlet UIImageView *flagImageView;
@property (weak, nonatomic) IBOutlet UILabel *countryNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *capitalNameLabel;

@end

@implementation RSVCountryInfoCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureCellAtIndexPath:(NSIndexPath *)indexPath
{
    RSVDataItem *item = [self.dataModel
                         getCountryOnContinent:self.dataModel.continents[indexPath.section] byIndex:indexPath.row];
    self.countryNameLabel.text = [NSString stringWithFormat:@"%@ (%@)",
                                  item.countryName, item.countryLocalName];
    self.capitalNameLabel.text = item.capitalName.copy;
    self.flagImageView.image = [self.dataModel getImageForKey:item.flagURL atIndexPath:indexPath];
}

- (void)prepareForReuse
{

}

@end
