//
//  UIButton+Block.h
//  ButtonBlock
//
//  Created by 朱佳男 on 2018/1/5.
//  Copyright © 2018年 ShangYuKeJi. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ButtonActionBlock)(UIButton *button);
@interface UIButton (Block)
@property (nonatomic ,copy)ButtonActionBlock actionBlock;
+(UIButton *)creatButtonWithFrame:(CGRect)frame title:(NSString *)title actionBlock:(ButtonActionBlock)actionBlock;
@end
