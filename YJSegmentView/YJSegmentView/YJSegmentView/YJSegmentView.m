//
//  YJSegmentView.m
//  YJSegmentView
//
//  Created by YJHou on 16/5/28.
//  Copyright © 2016年 YJHou. All rights reserved.
//

#import "YJSegmentView.h"

@interface YJSegmentView ()

@property (nonatomic, strong) NSMutableArray * saveBtnMArray; // save Current exit Btn

@end

@implementation YJSegmentView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if (self) {
    }
    return self;
}

- (void)setDataSource:(id<YJSegmentViewDataSource>)dataSource{
    _dataSource = dataSource;
    NSArray * segmentTitles = [dataSource segmentView:self];
    [self _setSegmentMainViewWith:segmentTitles];
}



- (void)_setSegmentMainViewWith:(NSArray *)segmentTitles{
    
    // titles
//    NSArray * segmentTitles = [self segmentTitleDataSource];
    
    CGFloat width = self.frame.size.width / segmentTitles.count;
    
    NSString * firstLeftTitle = [segmentTitles objectAtIndex:0];
    CGFloat lineBottomImgViewW = [firstLeftTitle sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]}].width;
    for (int i = 0 ; i < segmentTitles.count ; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i * width, 0, width, self.frame.size.height)];
        button.tag = i+1;
        button.backgroundColor = [UIColor clearColor];
        [button setTitle:[segmentTitles objectAtIndex:i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected | UIControlStateHighlighted];
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        
        [button addTarget:self action:@selector(tapAction:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            button.selected = YES;
        }
        else{
            button.selected = NO;
        }
        
        [self.saveBtnMArray addObject:button];
        [self addSubview:button];
        
        if (i != segmentTitles.count || i != 0) {
            UILabel *line = [[UILabel alloc ] initWithFrame:CGRectMake(i * width , 0, 0.45, 40)];
            line.backgroundColor = [UIColor clearColor];
            [self bringSubviewToFront:line];
            [self addSubview:line];
        }
    }

}





#pragma mark - LazyLoad
- (NSMutableArray *)saveBtnMArray{
    if (_saveBtnMArray == nil) {
        _saveBtnMArray = [NSMutableArray array];
    }
    return _saveBtnMArray;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
