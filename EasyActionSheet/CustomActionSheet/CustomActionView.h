//
//  CustomActionView.h
//  EasyActionSheet
//
//  Created by odm2 on 16/7/8.
//  Copyright © 2016年 odm2. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomActionView : UIView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableViewController *tableViewController;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIView *bgAlphaView;

@property (nonatomic, strong)NSArray *cellArray;


-(void)show;


@end
