//
//  ModelUnitWrapper+.h
//  AMFWrapped
//
//  Created by Ron Aldrich on 8/16/23.
//

#import "ModelUnitWrapper.h"
#import "ModelElementWrapper+.h"

#include "ModelUnitPtr.hpp"

NS_ASSUME_NONNULL_BEGIN

@interface ModelUnitWrapper ()

@property (nonatomic, readonly) AMFCore::ModelUnitPtr modelUnitPtr;

- (id) initWithModelUnitPtr: (AMFCore::ModelUnitPtr) modelUnitPtr;

@end

NS_ASSUME_NONNULL_END
