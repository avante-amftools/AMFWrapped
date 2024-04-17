//
//  ModelNodeWrapper.h
//  AMFWrapped
//
//  Created by Ron Aldrich on 2/28/23.
//

#import <Foundation/Foundation.h>

#import <simd/simd.h>

NS_ASSUME_NONNULL_BEGIN

// Swift automatically translates C style pointers to UnsafePointer, which
//  is not nullable, so if normal or color are null, we will substitute the
//  following constants.  In order to insure that these constants cannot
//  be equal to anything that can be placed in an AMF document, I use NAN
//  values within the constants.

typedef struct VertexData
{
    const simd_double3 coordinates;
    const simd_double3 normal;
    const simd_double4 color;
} VertexData;

typedef struct TriangleData
{
    uint32_t indices[3];
    const simd_double3 normal;
    const simd_double4 color;
} TriangleData;

@interface ModelNodeWrapper : NSObject

+ (void) initialize;

@property (nonatomic, readonly) NSString* identifier;

@property (nonatomic, readonly) int vertexCount;

@property (nonatomic, readonly) VertexData* vertexData;

@property (nonatomic, readonly) int triangleCount;

@property (nonatomic, readonly) TriangleData* triangleData;

- (void) debugShow;

- (void) debugShow: (NSString*) indent;

@end

NS_ASSUME_NONNULL_END
