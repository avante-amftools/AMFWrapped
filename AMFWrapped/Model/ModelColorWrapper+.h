//
//  ModelColorWrapper+.h
//  AMFWrapped
//
//  Created by Ron Aldrich on 8/5/23.
//

#import "ModelColorWrapper.h"
#import "ModelElementWrapper+.h"

#include "ModelColorPtr.hpp"

NS_ASSUME_NONNULL_BEGIN

@interface ModelColorWrapper ()

@property (nonatomic, readonly) AMFCore::ModelColorPtr modelColorPtr;

- (id) initWithModelColorPtr: (AMFCore::ModelColorPtr) modelColorPtr;

@end

NS_ASSUME_NONNULL_END
