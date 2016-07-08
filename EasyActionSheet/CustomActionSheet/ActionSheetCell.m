//
//  ActionSheetCell.m
//  ImagePicker
//
//  Created by 张彤 on 6/21/16.
//  Copyright © 2016 Dennis. All rights reserved.
//

#import "ActionSheetCell.h"
#import "Masonry.h"
#import <objc/objc-runtime.h>

#define kBlockRuntimeKey @"kBlockRuntimeKey"
@interface ActionSheetCell()

@property (nonatomic, strong) UIButton *recordsButton;
@end


@implementation ActionSheetCell
-(instancetype)initWithTitle:(NSString *)title imageName:(NSString *)imgName style:(ActionCellStyle )actionStyle andReuseId:(NSString *)reuseId selectEvent:(ActionClickBlock)selectEvent{

    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    if(self){
    
        //自定义cell的子控件
        UIButton *button = [[UIButton alloc]init];
        button.imageEdgeInsets =UIEdgeInsetsMake(0, 0, 5, 0);
        button.userInteractionEnabled =NO;
        button.titleEdgeInsets= UIEdgeInsetsMake(0, 5, 0, 0);
        self.recordsButton = button;
        [self.contentView addSubview:self.recordsButton];
        [self.recordsButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(@(0));
            make.width.equalTo(@(250));
            make.centerY.equalTo(@(0));
            make.height.equalTo(self.contentView);
        }];

    
        [self.recordsButton setTitle:title forState:UIControlStateNormal];
        [self.recordsButton setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
        
        
        
        switch (actionStyle) {
            case ActionCellStyleDefault:
                [self.recordsButton setTitleColor:[UIColor colorWithRed:0/255.0 green:91/255.0 blue:255/255.0 alpha:1] forState:UIControlStateNormal];
                break;
            case ActionCellStyleDestructive:
                [self.recordsButton setTitleColor:[UIColor colorWithRed:255/255.0 green:30/255.0 blue:29/255.0 alpha:1] forState:UIControlStateNormal];
                break;
            default:
                break;
        }

        objc_setAssociatedObject(self, kBlockRuntimeKey, selectEvent, OBJC_ASSOCIATION_COPY_NONATOMIC);
        
        
        
    }
    
    

    return self;
}


/*
//-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
//
//    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if(self){
//        //自定义cell的子控件
//        UIButton *button = [[UIButton alloc]init];
//        button.imageEdgeInsets =UIEdgeInsetsMake(0, 0, 5, 0);
//        button.userInteractionEnabled =NO;
//        button.titleEdgeInsets= UIEdgeInsetsMake(0, 5, 0, 0);
//        self.recordsButton = button;
//        [self.contentView addSubview:self.recordsButton];
//        [self.recordsButton mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerX.equalTo(@(0));
//            make.width.equalTo(@(250));
//            make.centerY.equalTo(@(0));
//            make.height.equalTo(self.contentView);
//        }];
//
//    }
//
//    return self;
//
//}
 
////关联控件和数据
//-(void)setEntity:(ActionSheetCellModel *)entity{
//    _entity = entity;
//    
//    [self.recordsButton setTitle:entity.title forState:UIControlStateNormal];
//    [self.recordsButton setImage:[UIImage imageNamed:entity.imageName] forState:UIControlStateNormal];
//
//}

//与系统的ActionStyle类似,destructive类型显示标题为红色,default类型为蓝色
//-(void)setActionSheetCellStyle:(ActionCellStyle)actionSheetCellStyle{
//    _actionSheetCellStyle = actionSheetCellStyle;
//    switch (self.actionSheetCellStyle) {
//        case ActionCellStyleDefault:
//            [self.recordsButton setTitleColor:[UIColor colorWithRed:0/255.0 green:91/255.0 blue:255/255.0 alpha:1] forState:UIControlStateNormal];
//            break;
//        case ActionCellStyleDestructive:
//            [self.recordsButton setTitleColor:[UIColor colorWithRed:255/255.0 green:30/255.0 blue:29/255.0 alpha:1] forState:UIControlStateNormal];
//            break;
//        default:
//            break;
//    }
//
//
//}
 */
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setSelected:(BOOL)selected{

    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    ActionClickBlock block = objc_getAssociatedObject(self, kBlockRuntimeKey);
   
    if(selected){
    if(block){
        
        block();
    }
    }
    // Configure the view for the selected state
}
//-(BOOL)isSelected{
//    
//
//}

























@end
