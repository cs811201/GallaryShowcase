//
//  JRPhotoCell.m
//  GallaryShowCase
//
//  Created by 孙琳 on 8/8/14.
//  Copyright (c) 2014 Lin Spirit Tech. All rights reserved.
//

#import "JRPhotoCell.h"

@interface JRPhotoCell()
@property  (nonatomic,weak) IBOutlet   UIImageView *photoImageView;

@end

@implementation JRPhotoCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) setAsset:(ALAsset *)asset{
    _asset= asset;
    self.photoImageView.image=[UIImage imageWithCGImage:[asset thumbnail]];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
