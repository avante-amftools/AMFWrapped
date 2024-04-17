//
//  ModelNodeWrapper+.h
//  AMFWrapped
//
//  Created by Ron Aldrich on 2/28/23.
//

#import "ModelNodeWrapper.h"
#import "ModelElementWrapper+.h"

#include "ModelNodePtr.hpp"

NS_ASSUME_NONNULL_BEGIN

// In AMFCore, we use null pointers to indicate missing data, which
//  is not something we can reproduce in Swift (The Objective-C to Swift
//  translation code uses UnsafePointer, which is not nullable).
//
// Instead, we use NAN constants (which are not reproducible in
//  an amf file) to indicate missing data.

const simd_double3 noNormal = { NAN, NAN, NAN };
const simd_double4 noColor = { NAN, NAN, NAN, NAN };
const simd_double4 whiteColor = { 1, 1, 1, 1 };

@interface ModelNodeWrapper ()
{
    @public
    std::shared_ptr<std::vector<simd_float3>> vertexCoordinates;
    std::shared_ptr<std::vector<simd_float3>> vertexNormals;
    std::shared_ptr<std::vector<simd_packed_char4>> vertexColors;
    std::shared_ptr<std::vector<uint32_t>> triangleVertexIndices;
}

@property (nonatomic, assign, readwrite) AMFCore::ModelNodePtr modelNodePtr;

@property (nonatomic, assign, readwrite) int vertexCount;

@property (nonatomic, assign, readwrite) VertexData* vertexData;

@property (nonatomic, assign, readwrite) int triangleCount;

@property (nonatomic, assign, readwrite) TriangleData* triangleData;

- (id) initWithModelNodePtr: (AMFCore::ModelNodePtr) modelNodePtr;

@end

NS_ASSUME_NONNULL_END
