//
//  ModelAttributeWrapper+.h
//  AMFWrapped
//
//  Created by Ron Aldrich on 4/12/23.
//

#import "ModelAttributeWrapper.h"
#import "ModelElementWrapper+.h"

#include "ModelAttributePtr.hpp"

NS_ASSUME_NONNULL_BEGIN

@interface ModelAttributeWrapper ()

@property (nonatomic, readonly) AMFCore::ModelAttributePtr modelAttributePtr;

- (id) initWithModelAttributePtr: (AMFCore::ModelAttributePtr) modelAttributePtr;

@end

NS_ASSUME_NONNULL_END
