//
//  LCBadgeBtn.m
//  ChaHuiTongH
//
//  Created by 锡哥 on 16/4/11.
//  Copyright © 2016年 ChaXinKeJi. All rights reserved.
//

#import "LCVerticalBadgeBtn.h"

@implementation LCVerticalBadgeBtn

- (void)setBadgeString:(NSString *)badgeString{
    _badgeString = badgeString;
    self.badgeLabel = [self viewWithTag:77];
    
    //NNSLog(@"label--%@",label);
    if (self.badgeString && ![self.badgeString isEqualToString:@"0"]) {
        
       // Drawing code
        if (self.badgeLabel) {
            [self.badgeLabel removeFromSuperview];
        }
            self.badgeLabel = [[UILabel alloc]init];
            self.badgeLabel.backgroundColor = BASE_COLOR;
            self.badgeLabel.tag = 77;
            self.badgeLabel.layer.masksToBounds = YES;
            self.badgeLabel.layer.cornerRadius = 8;
            self.badgeLabel.textColor = [UIColor whiteColor];
            self.badgeLabel.textAlignment = NSTextAlignmentCenter;
            self.badgeLabel.font = [UIFont systemFontOfSize:10];

            self.badgeLabel.bounds = CGRectMake(0, 0, 16, 16);
        
            [self addSubview:self.badgeLabel];
        
        
        self.badgeLabel.text = badgeString;
        
        
    }else{
        self.badgeLabel.hidden = YES;
    }
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
    // 更改image的坐标
    CGPoint imageCenter = self.imageView.center;
    imageCenter.x = self.frame.size.width/2;
    imageCenter.y = (self.frame.size.height-self.imageView.frame.size.height)/2;
    self.imageView.center = imageCenter;
    
    // 更改label的坐标
    CGRect labelFrame = self.titleLabel.frame;
    labelFrame.origin.x = 0;
    labelFrame.origin.y = CGRectGetMaxY(self.imageView.frame) + 5;
    labelFrame.size.width = self.frame.size.width;

    self.titleLabel.frame = labelFrame;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    //NNSLog(@"btn:(%f,%f,%f,%f)",self.imageView.frame.origin.x,self.imageView.frame.origin.y,self.imageView.frame.size.width,self.imageView.frame.size.height);
    
    //image和label位置更换后，frame改变后再设置角标的值
    self.badgeLabel.center = CGPointMake(CGRectGetMaxX(self.imageView.frame) + 3, 5);

}


@end
