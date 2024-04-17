//
//  ModelTriangleWrapper+.h
//  AMFWrapped
//
//  Created by Ron Aldrich on 3/22/23.
//

#import "ModelTriangleWrapper.h"
#import "ModelElementWrapper+.h"

#include "ModelTrianglePtr.hpp"

NS_ASSUME_NONNULL_BEGIN

@interface ModelTriangleWrapper ()

@property (nonatomic, readonly) AMFCore::ModelTrianglePtr modelTrianglePtr;

- (id) initWithModelTrianglePtr: (AMFCore::ModelTrianglePtr) modelTrianglePtr;

@end

NS_ASSUME_NONNULL_END
