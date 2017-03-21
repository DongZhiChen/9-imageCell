//
//  DZFBBImageShow.h
//  Dome
//
//  Created by 陈东芝 on 17/3/22.
//  Copyright © 2017年 陈东芝. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DZFBBImageShowDelegate <NSObject>
- (void)imageShowIndex:(int)index;
- (void)imageDeleteIndex:(int)index;
@end

@interface DZFBBImageShow : UIView {
    NSMutableArray *arrayImageViews;
}

@property (nonatomic, assign) id<DZFBBImageShowDelegate> delegate;

@property (nonatomic, retain) NSMutableArray *arrayImage;

@end

