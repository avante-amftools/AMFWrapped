//
//  ModelMeshWrapper+.h
//  AMFWrapped
//
//  Created by Ron Aldrich on 2/28/23.
//

#import "ModelMeshWrapper.h"
#import "ModelElementWrapper+.h"

#include "ModelMeshPtr.hpp"

#include <vector>

NS_ASSUME_NONNULL_BEGIN

@interface ModelMeshWrapper ()
{
    std::vector<VertexData> vertexArray;
}

@property (nonatomic, readonly) AMFCore::ModelMeshPtr modelMeshPtr;

- (id) initWithModelMeshPtr: (AMFCore::ModelMeshPtr) modelMeshPtr;

@end

NS_ASSUME_NONNULL_END
