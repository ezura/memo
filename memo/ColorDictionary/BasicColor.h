//
//  BasicColor.h
//  memo
//
//  Created by ezura on 8/5/15.
//  Copyright (c) 2015 ezura. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BasicColor : NSObject

@property(nonatomic, readonly) NSString* id;
@property(nonatomic, readonly) NSString* name;

/**
 *  マスタ中で一番近い色を返す
 *
 *  @param color 探す色
 *
 *  @return マスタ中で一番近い色
 */
+ (instancetype)near:(UIColor*)color;

- (UIColor*)toUIColor;

+ (instancetype)redColor;
+ (instancetype)orangeColor;
+ (instancetype)greenColor;
+ (instancetype)yellowColor;

- (id)objectAtIndexedSubscript:(NSUInteger)idx;
- (void)setObject:(id)obj atIndexedSubscript:(NSUInteger)idx;
- (id)objectForKeyedSubscript:(id)key;
- (void)setObject:(id)anObject forKeyedSubscript:(id <NSCopying>)aKey;

@end
