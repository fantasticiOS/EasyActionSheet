//
//  CustomActionView.m
//  EasyActionSheet
//
//  Created by odm2 on 16/7/8.
//  Copyright © 2016年 odm2. All rights reserved.
//

#import "CustomActionView.h"
#import "Masonry.h"

#define kMainScreenHeight [UIScreen mainScreen].bounds.size.height
#define kMainScreenWidth [UIScreen mainScreen].bounds.size.width

@implementation CustomActionView
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if(self){
        
        //设置透明灰色背景
        self.bgAlphaView = [[UIView alloc]init];
        self.bgAlphaView.backgroundColor = [UIColor colorWithRed:135/255.0 green:135/255.0 blue:135/255.0 alpha:0.5];
        self.bgAlphaView.userInteractionEnabled =NO;
        [self addSubview:self.bgAlphaView];
        self.bgAlphaView.frame = CGRectMake(0, 0, kMainScreenWidth, kMainScreenHeight);
        [self sendSubviewToBack:self.bgAlphaView];
        
    }
    return self;
}




//当contentView有值时,设置contentView的frame
-(void)setContentView:(UIView *)contentView{
    
    _contentView = contentView;
    
    [self addSubview:contentView];
    contentView.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:0.9];
    self.contentView.frame = CGRectMake(0, kMainScreenHeight  , kMainScreenWidth, 150);
    
}
-(void)setCellArray:(NSArray *)cellArray{
    _cellArray =cellArray;
    
    self.contentView.frame = CGRectMake(0, kMainScreenHeight  , kMainScreenWidth, 50*_cellArray.count);
    
}



//当控制器属性有值的时候,赋给self.contentView,这是会调用_contentView的set方法
-(void)setTableViewController:(UITableViewController *)tableViewController{
    _tableViewController =tableViewController;
    _tableViewController.tableView.delegate =self;
    _tableViewController.tableView.dataSource =self;
    self.contentView =tableViewController.tableView;
    
    
}



//触摸到tableView之外的地方移除自定义view
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self dismissActionSheetView];
}


-(void)dismissActionSheetView{
    [UIView animateWithDuration:0.4 animations:^{
        self.bgAlphaView.alpha = 0;
        self.contentView.transform =CGAffineTransformMakeTranslation(0, kMainScreenHeight);
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        
    }];
    
    
    
}



//展示animateView
-(void)show{
    
    CGFloat y= self.cellArray.count*50;
    [UIView animateWithDuration:0.4 animations:^{
        self.contentView.transform = CGAffineTransformMakeTranslation(0,-y);
        self.bgAlphaView.alpha=1;
    }];
    
}

#pragma =====tableView  Delegate &  DataSource========
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.cellArray.count;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.cellArray[indexPath.row];
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //    self.actionBlock(indexPath);
    [self dismissActionSheetView];
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
