//
//  SecondViewController.m
//  WSY_AutoLayoutCell
//
//  Created by Andou on 14/12/23.
//  Copyright (c) 2014年 SCDev. All rights reserved.
//

#import "WSYLayoutCell.h"

@implementation WSYLayoutCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        


        
        
        self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        
    }
    return self;
}
- (void)awakeFromNib
{
    UIImageView *iconView = [UIImageView new];
    iconView.translatesAutoresizingMaskIntoConstraints = NO;
    [iconView setImage:[UIImage imageNamed:@"train"]];
    [self.contentView addSubview:iconView];
    
    UILabel *nameLabel = [UILabel new];
    nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [nameLabel setText:@"Three Days to See"];
    [self.contentView addSubview:nameLabel];

    
    _detailLabel = [UILabel new];
    _detailLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [_detailLabel setNumberOfLines:0];
    [self.contentView addSubview:_detailLabel];
//    _detailLabel.backgroundColor = [UIColor cyanColor];
//    nameLabel.backgroundColor = [UIColor greenColor];

    
    UIImageView *bigImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"train"]];
    bigImage.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:bigImage];
    
    NSDictionary *dictionary = NSDictionaryOfVariableBindings(iconView, nameLabel, _detailLabel, bigImage);
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-8-[iconView(40)]" options:0 metrics:nil views:dictionary]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[iconView(40)]" options:0 metrics:nil views:dictionary]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[iconView]-10-[nameLabel]-10-|" options:0 metrics:nil views:dictionary]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[iconView]-10-[_detailLabel]-10-|" options:0 metrics:nil views:dictionary]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[iconView]-10-[bigImage(200)]" options:0 metrics:nil views:dictionary]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[nameLabel(20)][_detailLabel]-10@999-[bigImage(200)]-10-|" options:0 metrics:nil views:dictionary]];
}
- (void)updateConstraints
{
//    if (!self.didSetupConstraints) {
//        NSDictionary *dictionary = NSDictionaryOfVariableBindings(_whiteView, _bodyLabel);
//        [self.contentView  addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-8-[_whiteView]-8-|" options:0 metrics:0 views:dictionary]];
//        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-2-[_whiteView]-2-|" options:0 metrics:0 views:dictionary]];
//        [self.contentView  addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-12-[_bodyLabel]-12-|" options:0 metrics:0 views:dictionary]];
//        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-6-[_bodyLabel]-6-|" options:0 metrics:0 views:dictionary]];
//        
//        self.didSetupConstraints = YES;
//    }
    
    [super updateConstraints];
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
