//
//  DZFBBImageShow.m
//  Dome
//
//  Created by 陈东芝 on 17/3/22.
//  Copyright © 2017年 陈东芝. All rights reserved.
//

#import "DZFBBImageShow.h"

static CGFloat speace = 20.0;
//static CGFloat W_H_Scale = 16/9;
static CGFloat deleteButtonWidth = 25.0;
@implementation DZFBBImageShow

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initData];
    }
    return self;
}

- (void)initData {
    arrayImageViews = [NSMutableArray new];
    _arrayImage = [NSMutableArray new];
    
    for (int i = 0 ; i < 9; i++) {
        UIImageView *IV_Image = [[UIImageView alloc] init];
        IV_Image.userInteractionEnabled = YES;
        IV_Image.tag = 100+i;
        IV_Image.contentMode = UIViewContentModeScaleAspectFill;
        IV_Image.clipsToBounds = YES;
        IV_Image.backgroundColor = [UIColor whiteColor];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchImageEventClick:)];
        [IV_Image addGestureRecognizer:tap];
        [arrayImageViews addObject:IV_Image];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = 200+i;
        btn.frame = CGRectMake(0, 0, deleteButtonWidth, deleteButtonWidth);
        btn.backgroundColor = [UIColor blueColor];
        [btn addTarget:self action:@selector(deleteImage:) forControlEvents:UIControlEventTouchUpInside];
        [IV_Image addSubview:btn];
    }
}

- (void)imageContentView {
    
    if (_arrayImage.count == 0) {
        self.frame = CGRectZero;
        return;
    }
    
    CGFloat imageWidth;
    int rowCount;
    
    if (_arrayImage.count == 1 || _arrayImage.count == 2 || _arrayImage.count == 4) {
        imageWidth = (CGRectGetWidth(self.bounds)-speace*3)/2.0;
        rowCount = 2;
    }else {
        imageWidth = (CGRectGetWidth(self.bounds)-speace*4)/3.0;
        rowCount = 3;
    }
    
    CGFloat X = 0;
    CGFloat Y = speace;
    int row = 0;
    for (int i = 0; i < _arrayImage.count; i++) {
        
        CGRect frame;
        if (i % rowCount == 0 && i != 0) {
            X = speace;
            row++;
            Y = row*(speace+imageWidth)+speace;
        }else {
            X = i%rowCount *(speace + imageWidth) + speace;
        }
        frame = CGRectMake(X, Y, imageWidth, imageWidth);
        UIImageView *IV_Image =arrayImageViews[i];
        IV_Image.frame = frame;
        IV_Image.image = [UIImage imageNamed:_arrayImage[i]];
        [self addSubview:IV_Image];
        
        UIButton *btn = IV_Image.subviews[0];
        btn.frame = CGRectMake(imageWidth-deleteButtonWidth, 0, deleteButtonWidth, deleteButtonWidth);
    
        if (i == _arrayImage.count-1) {
            CGRect viewFrame = self.frame;
            viewFrame.size.height = CGRectGetMaxY(frame)+speace;
            self.frame = viewFrame;
        }
    }
}

#pragma mark - Click
- (void)touchImageEventClick:(UIGestureRecognizer *)GR {
    UIImageView *imageView = (UIImageView *)GR.view;
    !self.delegate ?: [self.delegate imageShowIndex:(int)imageView.tag-100];
}

- (void)deleteImage:(UIButton *)sender {
    int index = (int)sender.tag-200;
    [_arrayImage removeObjectAtIndex:index];
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self imageContentView];
    !self.delegate ?: [self.delegate imageShowIndex:index];
}



#pragma mark - setter
- (void)setArrayImage:(NSMutableArray *)arrayImage {
    _arrayImage = arrayImage;
    [self imageContentView];
}

@end
