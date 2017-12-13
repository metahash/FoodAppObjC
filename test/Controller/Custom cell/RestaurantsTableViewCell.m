//
//  RestaurantsTableViewCell.m
//  test
//
//  Created by Victor
//  Copyright © 2017 Victor. All rights reserved.
//

#import "RestaurantsTableViewCell.h"
#import "Restaurant.h"
#import "UIImageView+WebCache.h"

@interface RestaurantsTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *restaurantImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

@end

@implementation RestaurantsTableViewCell

- (void) setModel:(Restaurant *)model {
    _model = model;
    self.nameLabel.text = model.name;
    self.addressLabel.text = model.address;
    self.numberLabel.text = model.phone;
    
    // With cache SDWEBIMAGE
    NSLog(@"%@",model.imageURL);
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",model.imageURL]];
    [self.restaurantImage sd_setImageWithURL:url];
    
    // Just model use Mantle
    //    NSURL *url = [NSURL URLWithString:model.imageURL];
    //    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    //    UIImage *tmpImage = [[UIImage alloc] initWithData:data];
    //    self.restaurantImage.image = tmpImage;
    
    
    //if simple KVC
    
    //    self.nameLabel.text = [model valueForKeyPath:@"name"];
    //    self.addressLabel.text = [model valueForKeyPath:@"address"];
    //    self.numberLabel.text = [model valueForKeyPath:@"phone"];
    //
    //    NSURL *url = [NSURL URLWithString:[model valueForKeyPath:@"logo"]];
    //    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    //    UIImage *tmpImage = [[UIImage alloc] initWithData:data];
    //    self.restaurantImage.image = tmpImage;
    
    
}

@end
