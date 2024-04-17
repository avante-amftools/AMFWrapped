//
//  ModelRootWrapper+.h
//  AMFWrapped
//
//  Created by Ron Aldrich on 2/28/23.
//

#import "ModelRootWrapper.h"
#import "ModelElementWrapper+.h"

#include "ModelRootPtr.hpp"

NS_ASSUME_NONNULL_BEGIN

@interface ModelRootWrapper ()

@property (nonatomic, readonly) AMFCore::ModelRootPtr modelRootPtr;

- (id) initWithModelRootPtr: (AMFCore::ModelRootPtr) ModelRootPtr;

@end

NS_ASSUME_NONNULL_END
