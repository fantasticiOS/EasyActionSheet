//
//  ActionSheetCell.h
//  ImagePicker
//
//  Created by 张彤 on 6/21/16.
//  Copyright © 2016 Dennis. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    
    ActionCellStyleDefault,
    ActionCellStyleDestructive
    

}ActionCellStyle;

typedef void (^ActionClickBlock)();


@interface ActionSheetCell : UITableViewCell

-(instancetype)initWithTitle:(NSString *)title imageName:(NSString *)imgName style:(ActionCellStyle )actionStyle andReuseId:(NSString *)reuseId selectEvent:(ActionClickBlock )selectEvent;

@end
