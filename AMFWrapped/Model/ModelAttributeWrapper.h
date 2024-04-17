//
//  ModelAttributeWrapper.h
//  AMFWrapped
//
//  Created by Ron Aldrich on 4/12/23.
//

#import "ModelNodeWrapper.h"

NS_ASSUME_NONNULL_BEGIN

@interface ModelAttributeWrapper : ModelNodeWrapper

+ (void) initialize;

@property (nonatomic, readwrite) NSString* value;

@end

NS_ASSUME_NONNULL_END
