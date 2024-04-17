//
//  ModelObjectWrapper+.h
//  AMFWrapped
//
//  Created by Ron Aldrich on 2/28/23.
//

#import "ModelObjectWrapper.h"
#import "ModelElementWrapper+.h"

#include "ModelObject.hpp"

NS_ASSUME_NONNULL_BEGIN

@interface ModelObjectWrapper ()

@property (nonatomic, readonly) AMFCore::ModelObjectPtr modelObjectPtr;

- (id) initWithModelObjectPtr: (AMFCore::ModelObjectPtr) modelObjectPtr;

@end

NS_ASSUME_NONNULL_END
