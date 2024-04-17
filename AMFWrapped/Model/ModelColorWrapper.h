//
//  ModelColorWrapper.h
//  AMFWrapped
//
//  Created by Ron Aldrich on 8/5/23.
//

#import "ModelElementWrapper.h"

//#import "Model<#Thing#>Wrapper.h"

NS_ASSUME_NONNULL_BEGIN

@interface ModelColorWrapper : ModelElementWrapper

+ (void) initialize;

@property (nonatomic, assign, readwrite) simd_double4 color;

@end

NS_ASSUME_NONNULL_END
