//
//  ModelMeshWrapper.mm
//  AMFWrapped
//
//  Created by Ron Aldrich on 2/28/23.
//

#import "ModelMeshWrapper.h"
#import "ModelMeshWrapper+.h"

#import "ModelNodeWrapper+.h"
#import "ModelVolumeWrapper+.h"
#import "ModelVertexWrapper+.h"

#include "ModelMesh.hpp"
#include "ModelVertices.hpp"
#include "ModelVertex.hpp"
#include "ModelCoordinate.hpp"

using namespace AMFCore;

@implementation ModelMeshWrapper

+ (void) initialize
{
    ModelMesh::initialize();
}

- (id) initWithModelMeshPtr: (AMFCore::ModelMeshPtr) modelMeshPtr
{
    if (self = [super initWithModelElementPtr: modelMeshPtr])
    {
        [self buildVertexArray];
        
        self.vertexCount = (int) vertexArray.size();
        self.vertexData = vertexArray.data();
    }
    
    return self;
}

- (ModelMeshPtr) modelMeshPtr
{
    return std::dynamic_pointer_cast<ModelMesh>(self.modelNodePtr);
}

- (NSArray<ModelVolumeWrapper*>*) volumeNodes
{
    NSMutableArray<ModelVolumeWrapper*>* result = [[NSMutableArray<ModelVolumeWrapper*> alloc] init];
    
    auto volumes = self.modelMeshPtr->modelVolumes();
    
    for (auto i = volumes.begin(); i != volumes.end(); i++)
    {
        ModelVolumeWrapper* volume = [[ModelVolumeWrapper alloc] initWithModelVolumePtr: *i
                                                                       modelMeshWrapper: self];
        
        [result addObject: volume];
    }
        
    return result;
}

- (NSArray<ModelVertexWrapper*>*) vertexNodes
{
    NSMutableArray<ModelVertexWrapper*>* result = [[NSMutableArray<ModelVertexWrapper*> alloc] init];
    
    auto vertices = self.modelMeshPtr->modelVertices()->modelVertexes();
    
    for (auto i = vertices.begin(); i != vertices.end(); i++)
    {
        ModelVertexWrapper* vertex = [[ModelVertexWrapper alloc] initWithModelVertexPtr: *i];
        
        [result addObject: vertex];
    }
    
    // printf("%s %lu modelVertices", __PRETTY_FUNCTION__, (unsigned long)result.count);
    
    return result;
}

- (void) buildVertexArray
{
    if (vertexArray.size() == 0)
    {
        // printf("%s\n", __PRETTY_FUNCTION__);

        auto vertices = self.modelMeshPtr->modelVertices()->modelVertexes();
        
        vertexArray.reserve(vertices.size());
        
        for (auto &vertex : vertices)
        {
            simd_double3 coordinates = reinterpret_cast<const simd_double3&>(vertex->coordinate());
            simd_double3 normal = noNormal;
            simd_double4 color = noColor;

            if (vertex->normal() != nullptr)
                normal = *reinterpret_cast<const simd_double3*>(vertex->normal());

            if (vertex->color() != nullptr)
                color = *reinterpret_cast<const simd_double4*>(vertex->color());

            VertexData vertexData { coordinates, normal, color };
                        
            vertexArray.push_back(vertexData);
        }
    }
}

@end
