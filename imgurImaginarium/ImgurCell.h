//
//  ImgurCell.h
//  imgurImaginarium
//
//  Created by Rahul Jain on 5/2/16.
//  Copyright © 2016 Rahul Jain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImgurCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imgurImageView;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (strong,nonatomic) UIImage *image;

@end
