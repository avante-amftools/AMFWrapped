//
//  ModelMetadataWrapper+.h
//  AMFWrapped
//
//  Created by Ron Aldrich on 4/12/23.
//

#import "ModelMetadataWrapper.h"
#import "ModelElementWrapper+.h"

#include "ModelMetadataPtr.hpp"

NS_ASSUME_NONNULL_BEGIN

@interface ModelMetadataWrapper ()

@property (nonatomic, readonly) AMFCore::ModelMetadataPtr modelMetadataPtr;

- (id) initWithModelMetadataPtr: (AMFCore::ModelMetadataPtr) modelMetadataPtr;

@end

NS_ASSUME_NONNULL_END
