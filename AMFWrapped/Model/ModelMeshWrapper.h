//
//  ModelMeshWrapper.h
//  AMFWrapped
//
//  Created by Ron Aldrich on 2/28/23.
//

#import "ModelElementWrapper.h"

#import "ModelVolumeWrapper.h"
#import "ModelVertexWrapper.h"

NS_ASSUME_NONNULL_BEGIN

@interface ModelMeshWrapper : ModelElementWrapper

+ (void) initialize;

@property (nonatomic, readonly) NSArray<ModelVolumeWrapper*>* volumeNodes;

// The array of vertex nodes can be quite expensive to build,
//  so using this should be avoided unless absolutely necessary.
//
//  Use vertexCount and vertexData instead.

@property (nonatomic, readonly) NSArray<ModelVertexWrapper*>* vertexNodes;

@end

NS_ASSUME_NONNULL_END
