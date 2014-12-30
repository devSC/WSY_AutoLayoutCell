//
//  SecondViewController.m
//  WSY_AutoLayoutCell
//
//  Created by Andou on 14/12/23.
//  Copyright (c) 2014年 SCDev. All rights reserved.
//

#import "WSYLayoutCell2.h"

@implementation WSYLayoutCell2

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        /*----Necessary-----*/
        self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        /*-----------------------*/
        _iconView = [UIImageView new];
        _iconView.translatesAutoresizingMaskIntoConstraints = NO;
        [_iconView setImage:[UIImage imageNamed:@"train"]];
        [self.contentView addSubview:_iconView];
        
        _nameLabel = [UILabel new];
        _nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [_nameLabel setText:@"Three Days to See "];
        [self.contentView addSubview:_nameLabel];

        
        _detailLabel = [UILabel new];
        _detailLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [_detailLabel setNumberOfLines:0];
        [self.contentView addSubview:_detailLabel];

        
        _bigImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"train"]];
        _bigImage.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_bigImage];
//        _detailLabel.backgroundColor = [UIColor cyanColor];
//        _nameLabel.backgroundColor = [UIColor greenColor];
        [self updateFonts];
    }
    
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints) {
        NSDictionary *dictionary = NSDictionaryOfVariableBindings(_iconView, _nameLabel, _detailLabel, _bigImage);
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-8-[_iconView(40)]" options:0 metrics:nil views:dictionary]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[_iconView(40)]" options:0 metrics:nil views:dictionary]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[_iconView]-10-[_nameLabel]-10-|" options:0 metrics:nil views:dictionary]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[_iconView]-10-[_detailLabel]-10-|" options:0 metrics:nil views:dictionary]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[_iconView]-10-[_bigImage(200)]" options:0 metrics:nil views:dictionary]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[_nameLabel(20)][_detailLabel]-10@999-[_bigImage(200)]-10-|" options:0 metrics:nil views:dictionary]];
        self.didSetupConstraints = YES;
    }
    
    [super updateConstraints];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // Make sure the contentView does a layout pass here so that its subviews have their frames set, which we
    // need to use to set the preferredMaxLayoutWidth below.
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];
    
    // Set the preferredMaxLayoutWidth of the mutli-line bodyLabel based on the evaluated width of the label's frame,
    // as this will allow the text to wrap correctly, and as a result allow the label to take on the correct height.
    /*-----Mutli-line Necessary------*/
    self.detailLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.detailLabel.frame);
}

- (void)updateFonts
{
    //    self.titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    self.detailLabel.font = [UIFont fontWithName:@"Avenir Light" size:16];
}
@end
