//
//  YJSegmentView.h
//  YJSegmentView
//
//  Created by YJHou on 16/5/28.
//  Copyright © 2016年 YJHou. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YJSegmentView;
@protocol YJSegmentViewDataSource <NSObject>

@required;

/** 分段显示的标题数据源 */
- (NSArray *)segmentView:(YJSegmentView *)segmentView;

@end

@interface YJSegmentView : UIView

@property (nonatomic, weak) id<YJSegmentViewDataSource> dataSource;


@end
