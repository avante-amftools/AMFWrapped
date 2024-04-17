//
//  ModelVertexWrapper.mm
//  AMFWrapped
//
//  Created by Ron Aldrich on 3/22/23.
//

#import "ModelVertexWrapper.h"
#import "ModelVertexWrapper+.h"

#import "ModelNodeWrapper+.h"

#include "ModelVertex.hpp"
#include "ModelCoordinate.hpp"
#include "ModelNormal.hpp"
#include "ModelColor.hpp"

using namespace AMFCore;

@implementation ModelVertexWrapper

+ (void) initialize
{
    ModelVertex::initialize();
}

- (id) initWithModelVertexPtr: (AMFCore::ModelVertexPtr) modelVertexPtr
{
    return [super initWithModelElementPtr: modelVertexPtr];
}

- (ModelVertexPtr) modelVertexPtr
{
    return std::dynamic_pointer_cast<ModelVertex>(self.modelNodePtr);
}

- (VertexData) vertexData
{
    const simd_double3& coordinates = reinterpret_cast<const simd_double3&>( self.modelVertexPtr->coordinate());
    const simd_double3* normal = reinterpret_cast<const simd_double3*>(self.modelVertexPtr->normal());
    const simd_double4* color = reinterpret_cast<const simd_double4*>(self.modelVertexPtr->color());
    
    VertexData result =
    {
        coordinates,
        (normal ? *normal : noNormal),
        (color ? *color : noColor)
    };
        
    return result;
}

@end
