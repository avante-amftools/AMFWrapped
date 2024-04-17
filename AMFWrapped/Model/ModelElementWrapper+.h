//
//  ModelElementWrapper+.h
//  AMFWrapped
//
//  Created by Ron Aldrich on 2/28/23.
//

#import "ModelElementWrapper.h"
#import "ModelElementWrapper+.h"

#include "ModelElementPtr.hpp"

NS_ASSUME_NONNULL_BEGIN

@interface ModelElementWrapper ()

@property (nonatomic, readonly) AMFCore::ModelElementPtr modelElementPtr;

- (id) initWithModelElementPtr: (AMFCore::ModelElementPtr) modelElementPtr;

@end

NS_ASSUME_NONNULL_END
