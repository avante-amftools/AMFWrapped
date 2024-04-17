//
//  ModelVolumeWrapper.mm
//  AMFWrapped
//
//  Created by Ron Aldrich on 2/28/23.
//

#import "ModelVolumeWrapper.h"
#import "ModelVolumeWrapper+.h"

#import "ModelMeshWrapper+.h"

#import "ModelNodeWrapper+.h"
#import "ModelTriangleWrapper+.h"

#include "ModelMesh.hpp"
#include "ModelVolume.hpp"
#include "ModelTriangle.hpp"
#include "ModelColor.hpp"

using namespace AMFCore;

@implementation ModelVolumeWrapper

+ (void) initialize
{
    ModelVolume::initialize();
}

- (id) initWithModelVolumePtr: (AMFCore::ModelVolumePtr) modelVolumePtr
             modelMeshWrapper: (ModelMeshWrapper*) modelMeshWrapper
{
    // printf("init %s\n", modelVolumePtr->identifier().c_str());
        
    if (self = [super initWithModelElementPtr: modelVolumePtr])
    {
        self.modelMeshWrapper = modelMeshWrapper;
        
        [self buildTriangleArray];
                        
        self.vertexCount = modelMeshWrapper.vertexCount;
        self.vertexData = modelMeshWrapper.vertexData;
        
        self.triangleCount = (int) triangleArray.size();
        self.triangleData = triangleArray.data();
        
        /*
        
        VertexData* vertex = self.vertexData;
        
        for (int index = 0; index < self.vertexCount; index++)
        {
            printf("[%d] coordinates: %f, %f, %f\n", index, vertex->coordinates.x, vertex->coordinates.y, vertex->coordinates.z);
            printf("     normal: %f, %f, %f\n", vertex->normal.x, vertex->normal.y, vertex->normal.z);
            printf("     color: %f, %f, %f, %f\n", vertex->color.r, vertex->color.g, vertex->color.b, vertex->color.a);
            
            vertex++;
        }
        
        TriangleData* triangle = self.triangleData;
        
        for (int index = 0; index < self.triangleCount; index++)
        {
            printf("[%d] indices: %d, %d, %d\n", index, triangle->indices[0], triangle->indices[1], triangle->indices[2]);
            printf("     normal: %f, %f, %f\n", triangle->normal.x, triangle->normal.y, triangle->normal.z);
            printf("     color: %f, %f, %f, %f\n", triangle->color.r, triangle->color.g, triangle->color.b, triangle->color.a);
            
            triangle++;
        }
         
         */
    }
    
    return self;
}

- (void) dealloc
{
    // printf("dealloc %s\n", self.modelVolumePtr->identifier().c_str());
}

- (ModelVolumePtr) modelVolumePtr
{
    return std::dynamic_pointer_cast<ModelVolume>(self.modelNodePtr);
}

- (NSArray<ModelTriangleWrapper*>*) triangleNodes
{
    NSMutableArray<ModelTriangleWrapper*>* result = [[NSMutableArray<ModelTriangleWrapper*> alloc] init];
    
    auto triangles = self.modelVolumePtr->modelTriangles();
    
    for (auto i = triangles.begin(); i != triangles.end(); i++)
    {
        ModelTriangleWrapper* triangle = [[ModelTriangleWrapper alloc] initWithModelTrianglePtr: *i];
        
        [result addObject: triangle];
    }
        
    return result;
}

- (ModelMaterialWrapper*) materialNode
{
#if 0
    auto material = self.modelObjectPtr->modelMaterial();
    
    return [[ModelMaterialWrapper alloc] initWithModelMaterialPtr: material];
#else
    return NULL;
#endif
}

// Vertex indices and vertex colors.

- (void) buildTriangleArray
{
    if (triangleArray.size() == 0)
    {
        auto triangles = self.modelVolumePtr->modelTriangles();
        
        triangleArray.reserve(triangles.size());

        for (auto &triangle : triangles)
        {
            auto indices = triangle->valueAsVector3D();
            
            simd_double4 triangleColor = noColor;
            if (triangle->color())
            {
                auto amfColor = triangle->color()->valueAsColor();
                triangleColor = simd_make_double4(amfColor.r(), amfColor.g(), amfColor.b(), amfColor.a());
            }
            
            auto amfNormal = triangle->faceNormal();
            auto faceNormal = simd_make_double3(amfNormal.x(), amfNormal.y(), amfNormal.z());
            
            TriangleData triangleData = { { indices.v0(), indices.v1(), indices.v2() }, faceNormal, triangleColor };
            
            triangleArray.push_back(triangleData);
        }
    }
}

@end
