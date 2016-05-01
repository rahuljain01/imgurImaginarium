//
//  ImgurCell.m
//  imgurImaginarium
//
//  Created by Rahul Jain on 5/2/16.
//  Copyright © 2016 Rahul Jain. All rights reserved.
//

#import "ImgurCell.h"

@implementation ImgurCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setImage:(UIImage *)image{
    
    _image = image;
    self.imageView.image = image;
    
}

@end
