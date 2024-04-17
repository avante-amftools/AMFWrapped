//
//  ModelVolumeWrapper+.h
//  AMFWrapped
//
//  Created by Ron Aldrich on 2/28/23.
//

#import "ModelVolumeWrapper.h"
#import "ModelElementWrapper+.h"

#include "ModelVolumePtr.hpp"

#include "ModelMeshWrapper.h"

#include <vector>

NS_ASSUME_NONNULL_BEGIN

@interface ModelVolumeWrapper ()
{
    std::vector<TriangleData> triangleArray;
}

@property (nonatomic, readonly) AMFCore::ModelVolumePtr modelVolumePtr;

@property (nonatomic, readwrite) ModelMeshWrapper* modelMeshWrapper;

- (id) initWithModelVolumePtr: (AMFCore::ModelVolumePtr) modelVolumePtr
             modelMeshWrapper: (ModelMeshWrapper*) modelMeshWrapper;

@end

NS_ASSUME_NONNULL_END
