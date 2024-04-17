//
//  ModelVertexWrapper+.h
//  AMFWrapped
//
//  Created by Ron Aldrich on 3/22/23.
//

#import "ModelVertexWrapper.h"
#import "ModelElementWrapper+.h"

#include "ModelVertexPtr.hpp"

NS_ASSUME_NONNULL_BEGIN

@interface ModelVertexWrapper ()

@property (nonatomic, readonly) AMFCore::ModelVertexPtr modelVertexPtr;

- (id) initWithModelVertexPtr: (AMFCore::ModelVertexPtr) modelVertexPtr;

@end

NS_ASSUME_NONNULL_END
