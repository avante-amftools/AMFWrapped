//
//  ModelTriangleWrapper.mm
//  AMFWrapped
//
//  Created by Ron Aldrich on 3/22/23.
//

#import "ModelTriangleWrapper.h"
#import "ModelTriangleWrapper+.h"

#import "ModelNodeWrapper+.h"

#include "ModelTriangle.hpp"

using namespace AMFCore;

@implementation ModelTriangleWrapper

+ (void) initialize
{
    ModelTriangle::initialize();
}

- (id) initWithModelTrianglePtr: (AMFCore::ModelTrianglePtr) modelTrianglePtr
{
    return [super initWithModelElementPtr: modelTrianglePtr];
}

- (ModelTrianglePtr) modelTrianglePtr
{
    return std::dynamic_pointer_cast<ModelTriangle>(self.modelNodePtr);
}

- (VertexIndices) vertexIndices
{
    UInt32Vector3D value = self.modelTrianglePtr->valueAsVector3D();
    
    VertexIndices result = { value.x(), value.y(), value.z() };
    
    return result;
}

@end
