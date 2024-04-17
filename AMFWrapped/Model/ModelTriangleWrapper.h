//
//  ModelTriangleWrapper.h
//  AMFWrapped
//
//  Created by Ron Aldrich on 3/22/23.
//

#import "ModelElementWrapper.h"

NS_ASSUME_NONNULL_BEGIN

typedef struct VertexIndices
{
    uint32_t i0;
    uint32_t i1;
    uint32_t i2;
} VertexIndices;

@interface ModelTriangleWrapper : ModelElementWrapper

+ (void) initialize;

@property (nonatomic, readonly) VertexIndices vertexIndices;

@end

NS_ASSUME_NONNULL_END
