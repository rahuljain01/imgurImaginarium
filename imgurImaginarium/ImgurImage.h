//
//  ImgurImage.h
//  imgurImaginarium
//
//  Created by Rahul Jain on 5/2/16.
//  Copyright © 2016 Rahul Jain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImgurImage : NSObject

@property (nonatomic,strong) NSString *imageId;
@property (nonatomic,strong) NSString *imageTitle;
@property (nonatomic,strong) NSString *imageDescription;
@property (nonatomic,strong) NSString *imageUrl;
@property (nonatomic,strong) NSNumber *width;
@property (nonatomic,strong) NSNumber *height;

@end
